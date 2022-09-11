defmodule OpenAPI.Generator do
  alias OpenAPI.Generator.Options
  alias OpenAPI.Generator.State
  alias OpenAPI.Spec

  @typep pre_state :: %State{}
  @type state :: State.t()

  @spec run(Spec.t(), keyword) :: any
  def run(spec, opts) do
    %State{}
    |> process_options(opts)
    |> collect_schemas(spec)
    |> OpenAPI.Generator.Schema.write_all()
  end

  @spec process_options(pre_state, keyword) :: pre_state
  defp process_options(state, opts) do
    options = Options.new(opts)
    %{state | options: options}
  end

  @spec collect_schemas(pre_state, Spec.t()) :: pre_state
  defp collect_schemas(state, spec) do
    schemas =
      Enum.map(spec.components.schemas, fn {name, schema} ->
        module = process_name(state, name)
        {name, module, schema}
      end)
      |> Enum.reject(fn {name, module, _schema} -> ignored?(state, name, module) end)

    %{state | schemas: schemas}
  end

  @spec ignored?(pre_state, String.t(), module) :: boolean
  defp ignored?(%State{options: %{ignore: ignore}}, schema_name, schema_module) do
    Enum.any?(ignore, fn
      %Regex{} = regex -> Regex.match?(regex, schema_name)
      ^schema_name -> true
      ^schema_module -> true
      _ -> false
    end)
  end

  @spec process_name(pre_state, String.t()) :: String.t()
  defp process_name(%State{options: %{group: group, replace: replace}}, schema_name) do
    schema_name
    |> String.replace("-", "_")
    |> Macro.camelize()
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
end
