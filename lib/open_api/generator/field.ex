defmodule OpenAPI.Generator.Field do
  alias OpenAPI.Generator.Typing
  alias OpenAPI.Spec
  alias OpenAPI.State

  @type t :: %__MODULE__{
          name: String.t(),
          nullable: boolean,
          required: boolean,
          type: Typing.t()
        }

  defstruct [
    :name,
    :nullable,
    :required,
    :type
  ]

  @doc """
  Create a list of Fields based on the properties of the given `schema`.

  See `Typing.schema_to_type/3` for more information about available options.
  """
  @spec list_from_spec(State.t(), Spec.Schema.t(), keyword) :: [t]
  def list_from_spec(state, schema, opts \\ [])

  def list_from_spec(state, %Spec.Schema{properties: properties, required: required}, opts) do
    Enum.map(properties, fn {field_name, %Spec.Schema{nullable: nullable?} = schema} ->
      required? = is_list(required) and field_name in required

      %__MODULE__{
        name: field_name,
        nullable: nullable?,
        required: required?,
        type: Typing.schema_to_type(state, schema, opts)
      }
    end)
  end
end
