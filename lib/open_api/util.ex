defmodule OpenAPI.Util do
  alias OpenAPI.Spec.Schema
  alias OpenAPI.State

  @spec module_name(State.t(), Schema.t()) :: String.t() | nil
  def module_name(state, %Schema{"$oag_last_ref_path": ["components", "schemas", schema_name]}) do
    schema_module =
      schema_name
      |> String.replace("-", "_")
      |> Macro.camelize()
      |> then(fn module -> process_name(state, module) end)

    unless ignored?(state, schema_name, schema_module) do
      schema_module
    end
  end

  def module_name(_state, _schema), do: nil

  @spec process_name(State.t(), String.t()) :: String.t()
  defp process_name(%State{options: %{group: group, replace: replace}}, schema_name) do
    schema_name
    |> replace(replace)
    |> group(group)
  end

  @spec replace(String.t(), [{Options.replace_pattern(), Options.replace_action()}]) :: String.t()
  defp replace(schema_name, replacements) do
    Enum.reduce(replacements, schema_name, fn {pattern, replacement}, name ->
      String.replace(name, pattern, replacement)
    end)
  end

  @spec group(String.t(), [module]) :: String.t()
  defp group(schema_name, groups) do
    Enum.reduce(groups, schema_name, fn group, name ->
      group = inspect(group)

      cond do
        name == group -> name
        String.starts_with?(name, "#{group}.") -> name
        String.starts_with?(name, group) -> String.replace_leading(name, group, "#{group}.")
        true -> name
      end
    end)
  end

  @spec ignored?(State.t(), String.t(), String.t()) :: boolean
  defp ignored?(%State{options: %{ignore: ignore}}, schema_name, schema_module) do
    Enum.any?(ignore, fn
      %Regex{} = regex -> Regex.match?(regex, schema_name)
      ^schema_name -> true
      ^schema_module -> true
      _ -> false
    end)
  end
end
