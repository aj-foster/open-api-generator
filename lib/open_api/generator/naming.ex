defmodule OpenAPI.Generator.Naming do
  alias OpenAPI.Generator.Options
  alias OpenAPI.Spec.Schema
  alias OpenAPI.State

  @type module_and_type :: {module :: String.t(), type :: atom}

  @doc """
  Returns the name of the schema before processing the generator configuration.
  """
  @spec original_name(Schema.t()) :: module_and_type | nil
  def original_name(schema) do
    with {:ok, module_and_type} <- schema_to_module(schema) do
      module_and_type
    end
  end

  @spec processed_name(State.t(), module_and_type) :: module_and_type | nil
  def processed_name(%State{options: options}, module_and_type) do
    %Options{group: group, ignore: ignore, rename: rename} = options

    with {:ok, non_ignored_module} <- process_ignore_settings(module_and_type, ignore) do
      non_ignored_module
      |> process_rename_settings(rename)
      |> process_group_settings(group)
    end
  end

  @doc """
  Returns the name of the schema after processing the generator configuration.
  """
  @spec referenced_name(State.t(), Schema.t()) :: module_and_type | nil
  def referenced_name(%State{options: options}, schema) do
    %Options{group: group, ignore: ignore, merge: merge, rename: rename} = options

    with {:ok, module_and_type} <- schema_to_module(schema),
         {merged_module_and_type, _merged?} <- process_merge_settings(module_and_type, merge),
         {:ok, non_ignored_module} <- process_ignore_settings(merged_module_and_type, ignore) do
      non_ignored_module
      |> process_rename_settings(rename)
      |> process_group_settings(group)
    end
  end

  @spec schema_to_module(Schema.t()) :: {:ok, module_and_type} | nil
  defp schema_to_module(%Schema{"$oag_last_ref_path": ["components", "schemas", schema_name]}) do
    module =
      schema_name
      |> String.replace("-", "_")
      |> Macro.camelize()

    {:ok, {module, :t}}
  end

  defp schema_to_module(_schema), do: nil

  @spec process_merge_settings(module_and_type, Options.merge_options()) ::
          {module_and_type, boolean}
  defp process_merge_settings({module, type}, merge_options) do
    Enum.reduce(merge_options, {{module, type}, false}, fn
      {before_merge, after_merge}, {{module, type}, merged?} ->
        if module == to_string(before_merge) do
          new_type = merged_type(before_merge, after_merge)
          {{after_merge, new_type}, true}
        else
          {{module, type}, merged?}
        end

      {before_merge, after_merge, opts}, {name, merged?} ->
        if name == to_string(before_merge) do
          new_type =
            if new_type = opts[:type] do
              new_type
            else
              merged_type(before_merge, after_merge)
            end

          {{after_merge, new_type}, true}
        else
          {{module, type}, merged?}
        end
    end)
  end

  @spec merged_type(String.t() | atom, String.t() | atom) :: atom
  def merged_type(before_merge, after_merge) do
    cond do
      String.starts_with?(before_merge, after_merge) ->
        before_merge
        |> String.trim_leading(after_merge)
        |> Macro.underscore()

      String.ends_with?(before_merge, after_merge) ->
        before_merge
        |> String.trim_trailing(after_merge)
        |> Macro.underscore()

      :else ->
        Macro.underscore(before_merge)
    end
    |> String.to_atom()
  end

  @spec process_rename_settings(module_and_type, Options.rename_options()) :: module_and_type
  defp process_rename_settings({module, type}, replacements) do
    Enum.reduce(replacements, {module, type}, fn {pattern, replacement}, {module, type} ->
      {String.replace(module, pattern, replacement), type}
    end)
  end

  @spec process_group_settings(module_and_type, [module]) :: module_and_type
  defp process_group_settings({module, type}, groups) do
    Enum.reduce(groups, {module, type}, fn group, {module, type} ->
      group = inspect(group)

      cond do
        module == group ->
          {module, type}

        String.starts_with?(module, "#{group}.") ->
          {module, type}

        String.starts_with?(module, group) ->
          {String.replace_leading(module, group, "#{group}."), type}

        :else ->
          {module, type}
      end
    end)
  end

  @spec process_ignore_settings(module_and_type, Options.ignore_options()) ::
          {:ok, module_and_type} | nil
  defp process_ignore_settings({module, type}, ignore_options) do
    unless ignored?(module, ignore_options) do
      {:ok, {module, type}}
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
end
