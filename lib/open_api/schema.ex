defmodule OpenAPI.Schema do
  require EEx

  alias OpenAPI.Spec

  @file_base "lib/example/schemas"
  @module_base Example

  @replace [
    {~r/^Codespaces/, "Codespace"},
    {~r/^Scim/, "SCIM"},
    {~r/^Ssh/, "SSH"}
  ]

  @skip [
    ~r/^Nullable/
  ]

  @namespace [
    Actions,
    AdvancedSecurity,
    Branch,
    Check,
    CodeOfConduct,
    CodeScanning,
    Codespace,
    Commit,
    Content,
    Deployment,
    Gist,
    Hook,
    Installation,
    Issue,
    License,
    Marketplace,
    Organization,
    Project,
    ProtectedBranch,
    PullRequest,
    Release,
    Repository,
    Runner,
    SCIM,
    Team,
    Timeline,
    User,
    Webhook,
    Workflow
  ]

  def write_all(spec) do
    File.mkdir_p!(@file_base)

    for {name, schema} <- spec.components.schemas do
      name =
        name
        |> String.replace("-", "_")
        |> Macro.camelize()
        |> replace()
        |> namespace()

      unless primitive_type?(schema) or schema_skipped?(name) do
        write(name, schema)
      end
    end
  end

  def write(name, _schema) do
    base = inspect(@module_base)
    filename = Macro.underscore(name)

    file =
      render(base: base, schema: name)
      |> IO.inspect()
      |> Code.format_string!()

    location = Path.join(@file_base, filename <> ".ex")
    File.mkdir_p!(Path.dirname(location))
    File.write!(location, file)
    {location, name}
  end

  defp replace(schema_name) do
    Enum.reduce(@replace, schema_name, fn {pattern, replacement}, name ->
      String.replace(name, pattern, replacement)
    end)
  end

  defp primitive_type?(%Spec.Schema{type: "array"}), do: true
  defp primitive_type?(%Spec.Schema{type: "boolean"}), do: true
  defp primitive_type?(%Spec.Schema{type: "integer"}), do: true
  defp primitive_type?(%Spec.Schema{type: "string"}), do: true
  defp primitive_type?(_), do: false

  defp schema_skipped?(schema_name) do
    Enum.any?(@skip, fn
      %Regex{} = regex -> Regex.match?(regex, schema_name)
      ^schema_name -> true
      _ -> false
    end)
  end

  defp namespace(schema_name) do
    Enum.find_value(@namespace, schema_name, fn namespace ->
      namespace = inspect(namespace)

      IO.inspect(schema_name, label: "Schema Name")
      IO.inspect(namespace, label: "Namespace")

      if String.starts_with?(schema_name, namespace) do
        Enum.join([namespace, String.trim_leading(schema_name, namespace)], ".")
        |> String.trim_trailing(".")
      end
    end)
  end

  path = :code.priv_dir(:open_api) |> Path.join("templates/schema.eex")
  EEx.function_from_file(:defp, :render, path, [:assigns])
end
