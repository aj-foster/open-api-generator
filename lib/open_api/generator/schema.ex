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

  @spec discover(State.t(), any) :: State.t()
  def discover(state, spec)

  def discover(state, %Spec.Schema{} = schema) do
    state =
      if Naming.referenced_name(state, schema, skip_collapse: true) do
        {original_name, _type} = Naming.original_name(schema)
        %{state | schemas: Map.put_new(state.schemas, original_name, schema)}
      else
        state
      end

    Map.values(schema)
    |> Enum.reduce(state, fn value, state -> discover(state, value) end)
  end

  def discover(state, spec) when is_map(spec) do
    Map.values(spec)
    |> Enum.reduce(state, fn value, state -> discover(state, value) end)
  end

  def discover(state, spec) when is_list(spec) do
    Enum.reduce(spec, state, fn value, state -> discover(state, value) end)
  end

  def discover(state, _spec), do: state

  @spec process(State.t(), Spec.Schema.t()) :: t
  def process(state, schema) do
    fields =
      Field.list_from_spec(state, schema)
      |> Enum.map(fn %Field{name: name} = field -> {name, field} end)
      |> Enum.into(%{})

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
end
