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
        name_and_type = Naming.referenced_name(state, schema)
        required? = is_list(required) and field_name in required

        %Field{
          name: field_name,
          nullable: nullable?,
          required: required?,
          type: type(state, schema, name_and_type)
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

  def type(state, spec, name \\ nil)

  def type(state, %Spec.Schema{type: "array", items: %Spec.Schema{} = schema}, _name) do
    name_and_type = Naming.referenced_name(state, schema)
    {:array, type(state, schema, name_and_type)}
  end

  def type(state, %Spec.Schema{type: "array", items: items}, _name) do
    {:array, type(state, items)}
  end

  def type(_state, %Spec.Schema{type: "boolean"}, _name), do: :boolean
  def type(_state, %Spec.Schema{type: "integer"}, _name), do: :integer
  def type(_state, %Spec.Schema{type: "number"}, _name), do: :number
  def type(_state, %Spec.Schema{type: "string"}, _name), do: :string

  def type(state, %Spec.Schema{type: "object"}, name_and_type) do
    case name_and_type do
      {name, type} -> {Module.concat(state.options.base_module, name), type}
      _else -> :map
    end
  end

  def type(_state, %Spec.Schema{any_of: any_of}, _name) when is_list(any_of), do: :unknown
  def type(_state, %Spec.Schema{one_of: one_of}, _name) when is_list(one_of), do: :unknown
  def type(_state, %Spec.Schema{type: nil}, _name), do: :unknown

  def typespec(state, spec, name \\ nil)

  def typespec(state, %Spec.Schema{type: "array", items: items}, _name) do
    "[#{typespec(state, items)}]"
  end

  def typespec(_state, %Spec.Schema{type: "boolean"}, _name), do: "boolean"
  def typespec(_state, %Spec.Schema{type: "integer"}, _name), do: "integer"
  def typespec(_state, %Spec.Schema{type: "number"}, _name), do: "number"
  def typespec(_state, %Spec.Schema{type: "string"}, _name), do: "String.t()"

  def typespec(state, %Spec.Schema{type: "object"}, name) do
    if name do
      inspect(Module.concat(state.options.base_module, name)) <> ".t()"
    else
      "map"
    end
  end

  def typespec(_state, %Spec.Schema{any_of: any_of}, _name) when is_list(any_of), do: :unknown
  def typespec(_state, %Spec.Schema{one_of: one_of}, _name) when is_list(one_of), do: :unknown
  def typespec(_state, %Spec.Schema{type: nil}, _name), do: :unknown
end
