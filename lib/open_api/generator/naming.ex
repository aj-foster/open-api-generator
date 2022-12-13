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

  @doc """
  Returns the name of the schema after processing the generator configuration.
  """
  @spec referenced_name(State.t(), Schema.t(), keyword) :: module_and_type | nil
  def referenced_name(%State{options: options} = state, schema, opts \\ []) do
    %Options{group: group, ignore: ignore, merge: merge, rename: rename} = options

    with {:ok, module_and_type} <- schema_to_module(schema),
         merged_module_and_type <- process_merge_settings(module_and_type, merge),
         merged_module_and_type <-
           maybe_collapse_merged_schemas(
             opts[:skip_collapse],
             state,
             schema,
             merged_module_and_type
           ),
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

  @spec process_merge_settings(module_and_type, Options.merge_options()) :: module_and_type
  defp process_merge_settings({module, type}, merge_options) do
    Enum.reduce(merge_options, {module, type}, fn
      {before_merge, after_merge}, {module, type} ->
        cond do
          is_struct(before_merge, Regex) and Regex.match?(before_merge, module) ->
            new_module = String.replace(module, before_merge, after_merge)
            new_type = merged_type(module, new_module)
            {new_module, new_type}

          not is_struct(before_merge) and module == to_string(before_merge) ->
            new_type = merged_type(before_merge, after_merge)
            {after_merge, new_type}

          :else ->
            {module, type}
        end

        # {before_merge, after_merge, opts}, {name, merged?} ->
        #   if name == to_string(before_merge) do
        #     new_type =
        #       if new_type = opts[:type] do
        #         new_type
        #       else
        #         merged_type(before_merge, after_merge)
        #       end

        #     {{after_merge, new_type}, true}
        #   else
        #     {{module, type}, merged?}
        #   end
    end)
  end

  @spec merged_type(String.t() | atom, String.t() | atom) :: atom
  defp merged_type(before_merge, after_merge) do
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

  @spec maybe_collapse_merged_schemas(boolean, State.t(), Schema.t(), module_and_type) ::
          module_and_type
  defp maybe_collapse_merged_schemas(true, _state, _schema, module_and_type) do
    module_and_type
  end

  defp maybe_collapse_merged_schemas(_, state, schema, module_and_type) do
    collapse_merged_schemas(state, schema, module_and_type)
  end

  @spec collapse_merged_schemas(State.t(), Schema.t(), module_and_type) :: module_and_type
  defp collapse_merged_schemas(_state, _schema, {module, :t}), do: {module, :t}

  defp collapse_merged_schemas(state, schema, {module, type}) do
    destination_schema = state.schemas[module]

    cond do
      is_nil(destination_schema) ->
        {module, :t}

      same?(schema, destination_schema) ->
        {module, :t}

      :else ->
        {module, type}
    end
  end

  @spec same?(Schema.t(), Schema.t()) :: boolean
  defp same?(schema_one, schema_two) do
    schema_one_fields = fields(schema_one)
    schema_two_fields = fields(schema_two)

    Map.equal?(schema_one_fields, schema_two_fields)
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

  #
  # Duplicate Stuff
  #

  def fields(%Schema{properties: properties, required: required}) do
    Enum.map(properties, fn
      {field_name, %Schema{nullable: nullable?} = schema} ->
        required? = is_list(required) and field_name in required

        %{
          name: field_name,
          nullable: nullable?,
          required: required?,
          type: type(schema)
        }

      {field_name, spec} ->
        required? = is_list(required) and field_name in required

        %{
          name: field_name,
          nullable: false,
          required: required?,
          type: type(spec)
        }
    end)
    |> Enum.map(fn %{name: name} = field -> {name, field} end)
    |> Enum.into(%{})
  end

  def type(spec)

  def type(%Schema{type: "array", items: items}) do
    {:array, type(items)}
  end

  def type(%Schema{type: "boolean"}), do: :boolean
  def type(%Schema{type: "integer"}), do: :integer
  def type(%Schema{type: "number"}), do: :number
  def type(%Schema{type: "string"}), do: :string

  def type(%Schema{type: "object"} = schema) do
    original_name(schema) || :map
  end

  def type(%Schema{any_of: any_of}) when is_list(any_of) do
    {:union, Enum.map(any_of, &type/1)}
  end

  def type(%Schema{one_of: one_of}) when is_list(one_of) do
    {:union, Enum.map(one_of, &type/1)}
  end

  def type(%Schema{type: nil}), do: :unknown
end
