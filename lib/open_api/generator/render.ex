defmodule OpenAPI.Generator.Render do
  @moduledoc false

  alias OpenAPI.Generator.Field
  alias OpenAPI.Generator.Schema

  def render(file) do
    docstring = render_docstring(file)
    default_client = render_default_client(file)
    typespecs = render_typespecs(file.schemas)
    struct = render_struct(file.schemas)
    field_function = render_field_function(file.schemas)
    operations = render_operations(file.operations)

    module_contents =
      [docstring, default_client, typespecs, struct, field_function, operations]
      |> List.flatten()

    quote do
      defmodule unquote(file.module) do
        (unquote_splicing(module_contents))
      end
    end
    |> Code.quoted_to_algebra(escape: false)
    |> Inspect.Algebra.format(98)
    |> IO.iodata_to_binary()
  end

  defp render_docstring(_file) do
    {:@, [end_of_expression: [newlines: 2]],
     [{:moduledoc, [], ["Doc strings are not yet implemented."]}]}
  end

  defp render_default_client(%{operations: []}), do: []

  defp render_default_client(file) do
    {:@, [end_of_expression: [newlines: 2]], [{:default_client, [], [file.default_client]}]}
  end

  # TODO: Translate types into typespecs
  defp render_typespecs([]), do: []

  # TODO: Maybe remove Elixir from AST below
  defp render_typespecs(schemas) do
    for %Schema{fields: fields, final_type: type} <- schemas do
      fields = render_typespec_fields(fields)

      quote do
        @type unquote({type, [], Elixir}) :: %__MODULE__{
                unquote_splicing(fields)
              }
      end
    end
  end

  defp render_typespec_fields(fields) do
    fields
    |> Enum.sort_by(fn {name, _field} -> name end)
    |> Enum.map(fn {name, %Field{type: type}} ->
      quote do
        {unquote(String.to_atom(name)), unquote(type)}
      end
    end)
  end

  defp render_struct([]), do: []

  defp render_struct(schemas) do
    fields = render_struct_fields(schemas)

    quote do
      defstruct unquote(fields)
    end
  end

  defp render_struct_fields(schemas) do
    Enum.reduce(schemas, MapSet.new(), fn schema, fields ->
      new_field_names = Enum.map(schema.fields, fn {name, _field} -> String.to_atom(name) end)
      new_fields = MapSet.new(new_field_names)
      MapSet.union(fields, new_fields)
    end)
    |> MapSet.to_list()
    |> Enum.sort()
  end

  defp render_field_function([]), do: []

  defp render_field_function(schemas) do
    function_clauses = Enum.map(schemas, &render_field_function_clause/1)

    docstring =
      quote do
        @doc false
      end

    typespec =
      quote do
        @spec __fields__(atom) :: keyword
      end

    header =
      quote do
        def __fields__(type \\ :t)
      end

    [docstring, typespec, header, function_clauses]
  end

  defp render_field_function_clause(schema) do
    %Schema{fields: fields, final_type: type} = schema
    fields = render_field_function_clause_fields(fields)

    quote do
      def __fields__(unquote(type)) do
        unquote(fields)
      end
    end
  end

  defp render_field_function_clause_fields(fields) do
    fields
    |> Enum.sort_by(fn {name, _field} -> name end)
    |> Enum.map(fn {name, %Field{type: type}} ->
      quote do
        {unquote(String.to_atom(name)), unquote(type)}
      end
    end)
  end

  defp render_operations(operations) do
    operations
    |> Enum.sort_by(fn %{name: name} -> name end)
    |> Enum.map(fn operation ->
      docstring = render_operation_docs(operation)
      function = render_operation_function(operation)

      [docstring, function]
    end)
    |> List.flatten()
  end

  defp render_operation_docs(operation) do
    options =
      for {name, description, typespec} <- operation.query_params, reduce: "" do
        options ->
          options <> "\n  * `#{name}` (#{typespec}): #{description}"
      end

    options_section =
      if length(operation.query_params) > 0 do
        "\n## Options\n#{options}\n"
      else
        ""
      end

    resources_section =
      if operation.docs && operation.docs.url do
        if operation.docs.description do
          "\n## Resources\n\n  * [#{operation.docs.description}](#{operation.docs.url})\n"
        else
          "\n## Resources\n\n  * [Endpoint Documentation](#{operation.docs.url})\n"
        end
      else
        ""
      end

    docs = "#{operation.summary}\n#{options_section}#{resources_section}\n"

    {:@, [end_of_expression: [newlines: 1, line: 8]],
     [{:doc, [], [{:__block__, [delimiter: "\"\"\"", indentation: 2], [docs]}]}]}
  end

  defp render_operation_function(operation) do
    path_parameter_arguments =
      Enum.map(operation.path_params, fn {name, _spec, _type} ->
        {String.to_atom(name), [], nil}
      end)

    body_argument = if operation.body, do: [{:body, [], nil}], else: []

    opts_argument =
      quote do
        opts \\ []
      end

    arguments = List.flatten([path_parameter_arguments, body_argument, opts_argument])

    client = render_operation_client()
    query = render_operation_query(operation.query_params)
    call = render_operation_call(operation)

    operation_body =
      [client, query, call]
      |> Enum.reject(&is_nil/1)

    quote do
      def unquote(String.to_atom(operation.name))(unquote_splicing(arguments)) do
        (unquote_splicing(operation_body))
      end
    end
  end

  defp render_operation_client do
    quote do
      client = opts[:client] || @default_client
    end
  end

  defp render_operation_query(query_params) do
    if length(query_params) > 0 do
      params =
        query_params
        |> Enum.sort_by(fn {name, _, _} -> name end)
        |> Enum.map(fn {name, _, _} -> String.to_atom(name) end)

      quote do
        query = Keyword.take(opts, unquote(params))
      end
    end
  end

  defp render_operation_call(operation) do
    url =
      String.replace(operation.path, ~r/\{([[:word:]]+)\}/, "#\{\\1\}")
      |> then(&"\"#{&1}\"")
      |> Code.string_to_quoted!()
      |> then(fn url ->
        quote do
          {:url, unquote(url)}
        end
      end)

    method =
      quote do
        {:method, unquote(operation.method)}
      end

    body =
      if operation.body do
        quote do
          {:body, body}
        end
      end

    query =
      if length(operation.query_params) > 0 do
        quote do
          {:query, query}
        end
      end

    responses =
      if map_size(operation.responses) > 0 do
        items =
          operation.responses
          |> Enum.sort_by(fn {status, _type} -> status end)
          |> Enum.map(fn {status, type} ->
            {status, ""} = Integer.parse(status)

            quote do
              {unquote(status), unquote(type)}
            end
          end)

        quote do
          {:response, unquote(items)}
        end
      end

    options =
      quote do
        {:opts, opts}
      end

    request_details =
      [url, body, method, query, responses, options]
      |> Enum.reject(&is_nil/1)

    quote do
      client.request(%{
        unquote_splicing(request_details)
      })
    end
  end
end
