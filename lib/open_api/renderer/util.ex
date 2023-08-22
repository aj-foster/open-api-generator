defmodule OpenAPI.Renderer.Util do
  @moduledoc """
  Provides several helpful utilities for rendering and formatting files
  """
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Type
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State

  @doc """
  Flatten and remove `nil` elements from a list of AST nodes
  """
  @spec clean_list(Macro.t()) :: Macro.t()
  def clean_list(nodes) do
    nodes
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end

  @doc """
  Convert an AST into formatted code as a string

  The AST may include optional formatting metadata (ex. `delimiter`, `indentation`, or
  `end_of_expression`). It will be formatted to a line width of 98 to match the default Mix
  formatter.
  """
  @spec format(State.t(), File.t()) :: iodata
  def format(_state, file) do
    %File{ast: ast} = file

    ast
    |> format_multiline_docs()
    |> Code.quoted_to_algebra(escape: false)
    |> Inspect.Algebra.format(98)
    |> IO.iodata_to_binary()
  end

  @doc """
  Walks the given AST and replaces `@doc` and `@moduledoc` strings with `\"\"\"` blocks if the
  contents have newlines
  """
  @spec format_multiline_docs(Macro.t()) :: Macro.t()
  def format_multiline_docs(ast_node) do
    pre = fn
      {:doc, meta, [contents]} = node, acc ->
        if is_binary(contents) and String.contains?(contents, "\n") do
          {{:doc, meta, [{:__block__, [delimiter: "\"\"\"", indentation: 2], [contents]}]}, acc}
        else
          {node, acc}
        end

      {:moduledoc, meta, [contents]} = node, acc ->
        if is_binary(contents) and String.contains?(contents, "\n") do
          {{:moduledoc, meta, [{:__block__, [delimiter: "\"\"\"", indentation: 2], [contents]}]},
           acc}
        else
          {node, acc}
        end

      node, acc ->
        {node, acc}
    end

    post = fn ast_node, acc -> {ast_node, acc} end

    {ast_node, _acc} = Macro.traverse(ast_node, nil, pre, post)
    ast_node
  end

  @doc """
  Enforce the existence of whitespace after an expression
  """
  @spec put_newlines(Macro.t()) :: Macro.t()
  def put_newlines({term, metadata, arguments}) do
    end_of_expression =
      Keyword.get(metadata, :end_of_expression, [])
      |> Keyword.put(:newlines, 2)

    {term, Keyword.put(metadata, :end_of_expression, end_of_expression), arguments}
  end

  def put_newlines([node]), do: [put_newlines(node)]
  def put_newlines([head | tail]), do: [head | put_newlines(tail)]

  @doc """
  Collapse nested unions and replace references with {module, type} identifiers
  """
  @spec to_readable_type(State.t(), Type.t()) :: term
  def to_readable_type(state, type)

  def to_readable_type(state, {:array, type}) do
    inner_type = to_readable_type(state, type)
    [inner_type]
  end

  def to_readable_type(_state, {:union, []}), do: nil
  def to_readable_type(state, {:union, [type]}), do: to_readable_type(state, type)

  def to_readable_type(state, {:union, types}) do
    types =
      unwrap_unions(types)
      |> Enum.map(&to_readable_type(state, &1))

    {:union, types}
  end

  def to_readable_type(state, ref) when is_reference(ref) do
    case Map.get(state.schemas, ref) do
      %Schema{module_name: nil, type_name: type} ->
        type

      %Schema{module_name: schema_module, type_name: type} ->
        module_name =
          Module.concat([
            config(state)[:base_module],
            schema_module
          ])

        {module_name, type}

      nil ->
        :map
    end
  end

  def to_readable_type(_state, type), do: type

  @doc """
  Render an internal type as a typespec
  """
  @spec to_type(State.t(), Type.t() | {module, atom}) :: Macro.t()
  def to_type(state, type)

  # Primitives
  def to_type(_state, :boolean), do: quote(do: boolean)
  def to_type(_state, :integer), do: quote(do: integer)
  def to_type(_state, :number), do: quote(do: number)
  def to_type(_state, :null), do: quote(do: nil)

  # Strings
  def to_type(_state, {:string, :binary}), do: quote(do: binary)
  def to_type(_state, {:string, :date}), do: quote(do: Date.t())
  def to_type(_state, {:string, :date_time}), do: quote(do: DateTime.t())
  def to_type(_state, {:string, :time}), do: quote(do: Time.t())
  def to_type(_state, {:string, _}), do: quote(do: String.t())

  # Complex Types
  def to_type(state, {:array, type}) do
    inner_type = to_type(state, type)
    quote(do: [unquote(inner_type)])
  end

  def to_type(_state, {:const, literal}) when is_binary(literal), do: quote(do: String.t())
  def to_type(_state, {:const, literal}), do: quote(do: unquote(literal))

  def to_type(state, {:enum, literals}) do
    to_type(state, {:union, Enum.map(literals, &{:const, &1})})
  end

  def to_type(_state, {:union, []}), do: quote(do: nil)
  def to_type(state, {:union, [type]}), do: to_type(state, type)

  def to_type(state, {:union, types}) do
    types
    |> unwrap_unions()
    |> unwrap_enums()
    |> Enum.map(&to_type(state, &1))
    |> List.flatten()
    |> Enum.sort(&should_appear_in_this_order?/2)
    |> Enum.dedup()
    |> Enum.reverse()
    |> Enum.reduce(fn type, expression ->
      {:|, [], [type, expression]}
    end)
  end

  def to_type(state, ref) when is_reference(ref) do
    case Map.get(state.schemas, ref) do
      %Schema{module_name: nil, type_name: :map} ->
        quote do
          map
        end

      %Schema{module_name: module, type_name: type} ->
        quote do
          unquote(module).unquote(type)()
        end

      nil ->
        quote do
          unquote(:map)
        end
    end
  end

  # For types specified in configuration
  def to_type(_state, {module, type}) do
    quote do
      unquote(module).unquote(type)()
    end
  end

  @spec unwrap_enums([Type.t()]) :: [Type.t()]
  def unwrap_enums(types) do
    types
    |> Enum.map(fn
      {:enum, literals} -> Enum.map(literals, &{:const, &1})
      type -> type
    end)
    |> List.flatten()
  end

  @spec unwrap_unions([Type.t()]) :: [Type.t()]
  def unwrap_unions(types) do
    types
    |> Enum.map(fn
      {:union, types} -> unwrap_unions(types)
      type -> type
    end)
    |> List.flatten()
  end

  @spec should_appear_in_this_order?(Type.t(), Type.t()) :: boolean
  defp should_appear_in_this_order?(_, nil), do: true
  defp should_appear_in_this_order?(nil, _), do: false
  defp should_appear_in_this_order?(a, b), do: a >= b

  @doc """
  Write a rendered file to the filesystem
  """
  @spec write(State.t(), File.t()) :: :ok
  def write(_state, file) do
    %File{contents: contents, location: location} = file

    Elixir.File.mkdir_p!(Path.dirname(location))
    Elixir.File.write!(location, [contents, "\n"])
  end

  #
  # Helpers
  #

  @spec config(OpenAPI.Renderer.State.t()) :: Keyword.t()
  defp config(state) do
    %OpenAPI.Renderer.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:output, [])
  end
end
