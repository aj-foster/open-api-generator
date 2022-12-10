defmodule OpenAPI.Util do
  alias OpenAPI.Generator.Options
  alias OpenAPI.Spec.Schema
  alias OpenAPI.State

  @doc """
  Returns the name of the schema before processing the generator configuration.
  """
  @spec unprocessed_name(Schema.t()) :: String.t() | nil
  def unprocessed_name(schema) do
    with {:ok, module} <- schema_to_module(schema) do
      module
    end
  end

  @spec processed_name(State.t(), String.t()) :: String.t() | nil
  def processed_name(%State{options: options}, schema_name) do
    %Options{group: group, ignore: ignore, rename: rename} = options

    with {:ok, non_ignored_module} <- process_ignore_settings(schema_name, ignore) do
      non_ignored_module
      |> process_rename_settings(rename)
      |> process_group_settings(group)
    end
  end

  @doc """
  Returns the name of the schema after processing the generator configuration.
  """
  @spec referenced_name(State.t(), Schema.t()) :: String.t() | nil
  def referenced_name(%State{options: options}, schema) do
    %Options{group: group, ignore: ignore, merge: merge, rename: rename} = options

    with {:ok, module} <- schema_to_module(schema),
         {merged_module, _merged?} <- process_merge_settings(module, merge),
         {:ok, non_ignored_module} <- process_ignore_settings(merged_module, ignore) do
      non_ignored_module
      |> process_rename_settings(rename)
      |> process_group_settings(group)
    end
  end

  @spec schema_to_module(Schema.t()) :: {:ok, String.t()} | nil
  defp schema_to_module(%Schema{"$oag_last_ref_path": ["components", "schemas", schema_name]}) do
    module =
      schema_name
      |> String.replace("-", "_")
      |> Macro.camelize()

    {:ok, module}
  end

  defp schema_to_module(_schema), do: nil

  @spec process_rename_settings(String.t(), Options.rename_options()) :: String.t()
  defp process_rename_settings(schema_name, replacements) do
    Enum.reduce(replacements, schema_name, fn {pattern, replacement}, name ->
      String.replace(name, pattern, replacement)
    end)
  end

  @spec process_group_settings(String.t(), [module]) :: String.t()
  defp process_group_settings(schema_name, groups) do
    Enum.reduce(groups, schema_name, fn group, name ->
      group = inspect(group)

      cond do
        name == group -> name
        String.starts_with?(name, "#{group}.") -> name
        String.starts_with?(name, group) -> String.replace_leading(name, group, "#{group}.")
        :else -> name
      end
    end)
  end

  @spec process_ignore_settings(String.t(), Options.ignore_options()) :: {:ok, String.t()} | nil
  defp process_ignore_settings(schema_name, ignore_options) do
    unless ignored?(schema_name, ignore_options) do
      {:ok, schema_name}
    end
  end

  @spec ignored?(String.t(), Options.ignore_options()) :: boolean
  defp ignored?(schema_name, ignore_options) do
    Enum.any?(ignore_options, fn
      %Regex{} = regex -> Regex.match?(regex, schema_name)
      ^schema_name -> true
      _ -> false
    end)
  end

  @spec process_merge_settings(String.t(), Options.merge_options()) :: {String.t(), boolean}
  defp process_merge_settings(schema_name, merge_options) do
    Enum.reduce(merge_options, {schema_name, false}, fn {before_merge, after_merge},
                                                        {name, merged?} ->
      if name == to_string(before_merge) do
        {after_merge, true}
      else
        {name, merged?}
      end
    end)
  end
end
