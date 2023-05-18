defmodule OpenAPI.Generator.Field do
  @moduledoc false

  alias OpenAPI.Generator.Typing
  alias OpenAPI.Spec
  alias OpenAPI.State

  @type t :: %__MODULE__{
          name: String.t(),
          nullable: boolean,
          private: boolean,
          required: boolean,
          type: Typing.t()
        }

  defstruct name: nil,
            nullable: false,
            private: false,
            required: true,
            type: nil

  @doc """
  Create a list of Fields based on the properties of the given `schema`.

  See `Typing.schema_to_type/3` for more information about available options.
  """
  @spec list_from_spec(State.t(), Spec.Schema.t(), keyword) :: [t]
  def list_from_spec(state, schema, opts \\ [])

  def list_from_spec(state, %Spec.Schema{properties: properties, required: required}, opts) do
    properties =
      Enum.map(properties, fn {field_name, %Spec.Schema{nullable: nullable?} = schema} ->
        required? = is_list(required) and field_name in required

        %__MODULE__{
          name: field_name,
          nullable: nullable?,
          required: required?,
          type: Typing.schema_to_type(state, schema, opts)
        }
      end)

    properties ++ extra_fields(state)
  end

  @spec extra_fields(State.t()) :: [t]
  defp extra_fields(%State{config: %OpenAPI.Config{extra_fields: nil}}), do: []

  defp extra_fields(%State{config: %OpenAPI.Config{extra_fields: extra_fields}}) do
    Enum.map(extra_fields, fn {field_name, type} ->
      %__MODULE__{
        name: to_string(field_name),
        nullable: false,
        private: true,
        required: true,
        type: type
      }
    end)
  end
end
