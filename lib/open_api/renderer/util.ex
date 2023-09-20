defmodule OpenAPI.Renderer.Util do
  @moduledoc """
  Default implementation and helpers related to formatting and writing files

  This module contains the default implementations for:

    * `c:OpenAPI.Renderer.format/2`
    * `c:OpenAPI.Renderer.write/2`

  It also contains several helpers for working with ASTs, including the addition of formatting
  metadata necessary to create consistent code.
  """
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Type
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State

  @doc """
  Flatten and remove `nil` elements from a list of AST nodes

  This helper deals with cases in which certain sections of code are rendered conditionally, or
  with variable lengths of statements. `nil` values will be removed, and nested lists of nodes
  will be flattened.

  ## Example

      header = if condition, do: quote(do: IO.puts("List"))
      statements = for item <- items, do: quote(do: IO.puts(" * \#{item}"))

      clean_list([header, statements])

  """
  @spec clean_list(Macro.t()) :: Macro.t()
  def clean_list(nodes) do
    nodes
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end

  @doc """
  Convert an AST into formatted code as a string

  Default implementation of `c:OpenAPI.Renderer.format/2`.

  The AST may include optional formatting metadata (ex. `delimiter`, `indentation`, or
  `end_of_expression`). It will be formatted to a line width of 98 to match the default Mix
  formatter. In addition, any `@moduledoc` or `@doc` statements that contain a newline character
  will be modified to use `\"\"\"` as the delimiter.
  """
  @doc default_implementation: true
  @spec format(State.t(), File.t()) :: iodata
  def format(_state, file) do
    %File{ast: ast} = file

    ast
    |> format_multiline_docs()
    |> Code.quoted_to_algebra(escape: false)
    |> Inspect.Algebra.format(98)
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

  This helper is useful for cases in which single-line expressions should be separated from the
  following line by whitespace, but the formatter would not naturally insert that whitespace.
  For example:

      @my_attribute "Hello"
      @spec my_function :: String.t()
      def my_function, do: @my_attribute

  It may be desirable to insert whitespace following the module attribute `@my_attribute`. By
  calling this function on that node, the following will be output:

      @my_attribute "Hello"

      @spec my_function :: String.t()
      def my_function, do: @my_attribute

  If a list of nodes is given, the last node will receive the additional whitespace metadata.
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

  This function renders most types exactly as they are expressed internally
  (ex. `{:string, :generic}`), however it transforms certain union types to be more human-readable
  and it replaces schema references with the equivalent `{Module, :type}`.
  """
  @spec to_readable_type(State.t(), Type.t()) :: term
  def to_readable_type(state, type)

  def to_readable_type(state, {:array, type}) do
    inner_type = to_readable_type(state, type)
    [inner_type]
  end

  def to_readable_type(_state, {:union, []}), do: :null
  def to_readable_type(state, {:union, [type]}), do: to_readable_type(state, type)

  def to_readable_type(state, {:union, types}) do
    types =
      unwrap_unions(types)
      |> List.flatten()
      |> Enum.map(&to_readable_type(state, &1))
      |> Enum.sort(&should_appear_in_this_order?/2)
      |> Enum.dedup()
      |> Enum.reverse()

    case types do
      [] -> :null
      [type] -> type
      types -> {:union, types}
    end
  end

  def to_readable_type(state, ref) when is_reference(ref) do
    case Map.get(state.schemas, ref) do
      %Schema{module_name: nil, type_name: type} ->
        type

      %Schema{
        context: [{:request, module, _op_function_name, _content_type}],
        module_name: module
      } ->
        :map

      %Schema{
        context: [{:response, module, _op_function_name, _status, _content_type}],
        module_name: module
      } ->
        :map

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

  To the best of its ability, this function constructs an accurate typespec for the internal
  type given. Note that this is somewhat lossy; for example, many distinct types of strings will
  map to the `String.t()` type.
  """
  @spec to_type(State.t(), Type.t() | {module, atom}) :: Macro.t()
  def to_type(state, type)

  # Unnatural
  def to_type(_state, :any), do: quote(do: any)
  def to_type(_state, :map), do: quote(do: map)

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
    |> List.flatten()
    |> Enum.map(&to_type(state, &1))
    |> Enum.sort(&should_appear_in_this_order?/2)
    |> Enum.dedup()
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

      %Schema{
        context: [{:request, module, _op_function_name, _content_type}],
        module_name: module
      } ->
        quote do
          map
        end

      %Schema{
        context: [{:response, module, _op_function_name, _status, _content_type}],
        module_name: module
      } ->
        quote do
          map
        end

      %Schema{module_name: module, type_name: type} ->
        module_name =
          Module.concat([
            config(state)[:base_module],
            module
          ])

        quote do
          unquote(module_name).unquote(type)()
        end

      nil ->
        quote do
          map
        end
    end
  end

  # For types specified in configuration
  def to_type(_state, {module, type}) do
    quote do
      unquote(module).unquote(type)()
    end
  end

  @doc """
  Replace `enum` types with the equivalent list of `const` types

  This low-level helper is used by `to_type/2` when simplifying union types.
  """
  @spec unwrap_enums([Type.t()]) :: [Type.t()]
  def unwrap_enums(types) do
    types
    |> Enum.map(fn
      {:enum, literals} -> Enum.map(literals, &{:const, &1})
      type -> type
    end)
    |> List.flatten()
  end

  @doc """
  Flatten nested union types

  This low-level helper is used by `to_readable_type/2` and `to_type/2` when simplifying union
  types.
  """
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
  defp should_appear_in_this_order?(_, nil), do: false
  defp should_appear_in_this_order?(_, :null), do: false
  defp should_appear_in_this_order?(nil, _), do: true
  defp should_appear_in_this_order?(:null, _), do: true
  defp should_appear_in_this_order?(a, b), do: a >= b

  @doc """
  Write a rendered file to the filesystem

  Default implementation of `c:OpenAPI.Renderer.write/2`.

  This implementation writes the file `contents` to the `location` and ensures an additional
  newline is included at the end of the file. It also ensures that any subdirectories are created
  prior to writing. Any failure will result in a raised error.
  """
  @doc default_implementation: true
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
