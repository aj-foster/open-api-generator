defmodule OpenAPI.Generator.Typing do
  @moduledoc false

  alias OpenAPI.Generator.Naming
  alias OpenAPI.Spec

  @typedoc "Runtime type annotation"
  @type t ::
          :binary
          | :boolean
          | :integer
          | :map
          | :number
          | :string
          | :null
          | :unknown
          | {:array, t}
          | {:union, [t]}
          | {:nullable, t}
          | {module, atom}

  @doc """
  Determine the runtime type annotation of the given `schema`.

  ## Options

    * `:original`: When `true`, the original module and type will be returned for named schemas.
      This can be useful if the caller does not need to process merge, ignore, and group settings.
      Defaults to `false`.

  """
  @spec schema_to_type(State.t(), Spec.Schema.t(), keyword) :: t
  def schema_to_type(state, schema, opts \\ [])
  def schema_to_type(_state, %Spec.Schema{type: "boolean"}, _opts), do: :boolean
  def schema_to_type(_state, %Spec.Schema{type: "integer"}, _opts), do: :integer
  def schema_to_type(_state, %Spec.Schema{type: "number"}, _opts), do: :number
  def schema_to_type(_state, %Spec.Schema{type: "string"}, _opts), do: :string
  def schema_to_type(_state, %Spec.Schema{type: "null"}, _opts), do: :null

  def schema_to_type(state, %Spec.Schema{type: "array", items: items}, opts) do
    {:array, schema_to_type(state, items, opts)}
  end

  def schema_to_type(state, %Spec.Schema{type: types} = schema, opts) when is_list(types) do
    nullable? = Enum.any?(types, &(&1 == "null"))

    union =
      types
      |> Enum.reject(&(&1 == "null"))
      |> Enum.map(fn type ->
        schema_to_type(state, %Spec.Schema{schema | type: type}, opts)
      end)

    cond do
      nullable? and length(union) == 0 -> :null
      not nullable? and length(union) == 1 -> List.first(union)
      nullable? and length(union) == 1 -> {:nullable, List.first(union)}
      not nullable? -> {:union, union}
      nullable? -> {:nullable, {:union, union}}
    end
  end

  def schema_to_type(state, %Spec.Schema{any_of: any_of}, opts) when is_list(any_of) do
    types = Enum.map(any_of, &schema_to_type(state, &1, opts)) |> Enum.uniq()
    nullable? = Enum.any?(types, &(&1 == :null))
    union = Enum.reject(types, &(&1 == :null))

    cond do
      not nullable? and length(union) == 1 -> List.first(union)
      nullable? and length(union) == 1 -> {:nullable, List.first(union)}
      not nullable? -> {:union, union}
      nullable? -> {:nullable, {:union, union}}
    end
  end

  def schema_to_type(state, %Spec.Schema{one_of: one_of}, opts) when is_list(one_of) do
    types = Enum.map(one_of, &schema_to_type(state, &1, opts)) |> Enum.uniq()
    nullable? = Enum.any?(types, &(&1 == :null))
    union = Enum.reject(types, &(&1 == :null))

    cond do
      not nullable? and length(union) == 1 -> List.first(union)
      nullable? and length(union) == 1 -> {:nullable, List.first(union)}
      not nullable? -> {:union, union}
      nullable? -> {:nullable, {:union, union}}
    end
  end

  def schema_to_type(state, %Spec.Schema{type: "object"} = schema, opts) do
    if opts[:original] do
      Naming.original_name(schema)
    else
      Naming.referenced_name(state, schema)
    end
    |> case do
      {name, type} -> {Module.concat(state.config.base_module, name), type}
      _else -> :map
    end
  end

  def schema_to_type(_state, %Spec.Schema{type: nil, properties: props}, _opts)
      when is_map(props) do
    :map
  end

  def schema_to_type(_state, %Spec.Schema{type: nil}, _opts), do: :unknown
end
