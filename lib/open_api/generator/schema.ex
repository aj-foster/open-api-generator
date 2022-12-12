defmodule OpenAPI.Generator.Schema do
  alias OpenAPI.Generator.Field
  alias OpenAPI.Generator.Naming
  alias OpenAPI.Spec
  alias OpenAPI.State

  @type t :: %__MODULE__{
          fields: %{optional(String.t()) => Field.t()},
          final_name: String.t(),
          final_type: atom,
          original_name: String.t(),
          original_type: atom
        }

  defstruct [
    :fields,
    :final_name,
    :final_type,
    :original_name,
    :original_type
  ]

  @spec process(State.t(), Spec.Schema.t()) :: t
  def process(state, schema) do
    fields = fields(state, schema)
    {original_name, original_type} = Naming.original_name(schema)
    {final_name, final_type} = Naming.referenced_name(state, schema)

    %__MODULE__{
      fields: fields,
      final_name: final_name,
      final_type: final_type,
      original_name: original_name,
      original_type: original_type
    }
  end

  defp fields(state, %Spec.Schema{properties: properties, required: required}) do
    Enum.map(properties, fn
      {field_name, %Spec.Schema{nullable: nullable?} = schema} ->
        required? = is_list(required) and field_name in required

        %Field{
          name: field_name,
          nullable: nullable?,
          required: required?,
          type: type(state, schema)
        }

      {field_name, spec} ->
        required? = is_list(required) and field_name in required

        %Field{
          name: field_name,
          nullable: false,
          required: required?,
          type: type(state, spec)
        }
    end)
    |> Enum.map(fn %Field{name: name} = field -> {name, field} end)
    |> Enum.into(%{})
  end

  def type(state, spec)

  def type(state, %Spec.Schema{type: "array", items: items}) do
    {:array, type(state, items)}
  end

  def type(_state, %Spec.Schema{type: "boolean"}), do: :boolean
  def type(_state, %Spec.Schema{type: "integer"}), do: :integer
  def type(_state, %Spec.Schema{type: "number"}), do: :number
  def type(_state, %Spec.Schema{type: "string"}), do: :string

  def type(state, %Spec.Schema{type: "object"} = schema) do
    case Naming.referenced_name(state, schema) do
      {name, type} -> {Module.concat(state.options.base_module, name), type}
      _else -> :map
    end
  end

  def type(state, %Spec.Schema{any_of: any_of}) when is_list(any_of) do
    {:union, Enum.map(any_of, &type(state, &1))}
  end

  def type(state, %Spec.Schema{one_of: one_of}) when is_list(one_of) do
    {:union, Enum.map(one_of, &type(state, &1))}
  end

  def type(_state, %Spec.Schema{type: nil}), do: :unknown
end
