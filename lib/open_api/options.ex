defmodule OpenAPI.Config do
  @moduledoc false

  @type group_options :: [module]
  @type ignore_pattern :: Regex.t() | String.t() | module
  @type ignore_options :: [ignore_pattern]
  @type merge_options :: [{module, module}]
  @type rename_pattern :: String.pattern() | Regex.t()
  @type rename_action :: String.t() | (String.t() -> String.t())
  @type rename_options :: [{rename_pattern, rename_action}]

  @type t :: %__MODULE__{
          base_location: String.t(),
          base_module: module,
          default_client: module,
          group: group_options,
          ignore: ignore_options,
          merge: merge_options,
          operation_location: String.t(),
          rename: rename_options,
          schema_location: String.t()
        }

  defstruct [
    :base_location,
    :base_module,
    :default_client,
    :group,
    :ignore,
    :merge,
    :operation_location,
    :rename,
    :schema_location
  ]

  @spec new(keyword) :: t
  def new(opts) do
    base_module = get_base_module(opts[:base_module])

    %__MODULE__{
      base_location: get_base_location(opts[:base_location]),
      base_module: base_module,
      default_client: get_default_client(opts[:default_client], base_module),
      group: get_group(opts[:group]),
      ignore: get_ignore(opts[:ignore]),
      merge: get_merge(opts[:merge]),
      operation_location: get_operation_location(opts[:operation_location]),
      rename: get_rename(opts[:rename]),
      schema_location: get_schema_location(opts[:schema_location])
    }
  end

  @spec get_base_location(any) :: String.t() | no_return
  defp get_base_location(nil), do: raise(ArgumentError, "Option :base_location is required")
  defp get_base_location(value) when is_binary(value), do: value

  defp get_base_location(value),
    do: raise(ArgumentError, "Option :base_location expects a string, got #{inspect(value)}")

  @spec get_base_module(any) :: module | no_return
  defp get_base_module(nil), do: raise(ArgumentError, "Option :base_module is required")
  defp get_base_module(value) when is_atom(value), do: value

  defp get_base_module(value),
    do: raise(ArgumentError, "Option :base_module expects a module, got #{inspect(value)}")

  @spec get_default_client(any, module) :: module | no_return
  defp get_default_client(nil, base_module), do: Module.concat([base_module, Client])
  defp get_default_client(value, _base_module) when is_atom(value), do: value

  @spec get_group(any) :: [module] | no_return
  defp get_group(nil), do: []

  defp get_group(value) when is_list(value) do
    if Enum.all?(value, &is_atom/1) do
      value
    else
      raise ArgumentError, "Option :group expects a list of modules"
    end
  end

  @spec get_ignore(any) :: [ignore_pattern] | no_return
  defp get_ignore(nil), do: []

  defp get_ignore(value) when is_list(value) do
    if Enum.all?(value, fn
         %Regex{} -> true
         string when is_binary(string) -> true
         atom when is_atom(atom) -> true
         _ -> false
       end) do
      value
    else
      raise ArgumentError,
            "Option :ignore expects a list of regular expressions, strings, or modules"
    end
  end

  @spec get_merge(any) :: merge_options | no_return
  defp get_merge(nil), do: []

  defp get_merge(value) when is_list(value) do
    if Enum.all?(value, fn
         {%Regex{}, after_merge} ->
           is_atom(after_merge) or is_binary(after_merge)

         {before_merge, after_merge} ->
           (is_atom(before_merge) or is_binary(before_merge)) and
             (is_atom(after_merge) or is_binary(after_merge))
       end) do
      value
    else
      raise ArgumentError,
            "Option :merge expects a list of tuples with patterns and replacements"
    end
  end

  @spec get_operation_location(any) :: String.t() | no_return
  defp get_operation_location(nil), do: ""
  defp get_operation_location(value) when is_binary(value), do: value

  defp get_operation_location(value),
    do: raise(ArgumentError, "Option :operation_location expects a string, got #{inspect(value)}")

  @spec get_rename(any) :: [{rename_pattern, rename_action}] | no_return
  defp get_rename(nil), do: []

  defp get_rename(value) when is_list(value) do
    if Enum.all?(value, fn
         {compiled_pattern, _action} when is_tuple(compiled_pattern) -> true
         {string, _action} when is_binary(string) -> true
         {list, _action} when is_list(list) -> true
         {%Regex{}, _action} -> true
         _ -> false
       end) do
      value
    else
      raise ArgumentError,
            "Option :rename expects a list of tuples with patterns and replacements"
    end
  end

  @spec get_schema_location(any) :: String.t() | no_return
  defp get_schema_location(nil), do: ""
  defp get_schema_location(value) when is_binary(value), do: value

  defp get_schema_location(value),
    do: raise(ArgumentError, "Option :schema_location expects a string, got #{inspect(value)}")
end
