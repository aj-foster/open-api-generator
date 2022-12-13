defmodule OpenAPI.Generator.Render do
  @moduledoc false

  alias OpenAPI.Generator.Field
  alias OpenAPI.Generator.Schema

  def render(file) do
    moduledoc = render_moduledoc(file)
    default_client = render_default_client(file)
    types = render_types(file.schemas)
    struct = render_struct(file.schemas)
    field_function = render_field_function(file.schemas)
    operations = render_operations(file.operations)

    module_contents =
      [moduledoc, default_client, types, struct, field_function, operations]
      |> List.flatten()

    quote do
      defmodule unquote(file.module) do
        (unquote_splicing(module_contents))
      end
    end
    |> put_multiline_docs()
    |> Code.quoted_to_algebra(escape: false)
    |> Inspect.Algebra.format(98)
    |> IO.iodata_to_binary()
  end

  defp render_moduledoc(file) do
    header =
      cond do
        file.operations == [] ->
          schemas = Enum.map(file.schemas, & &1.original_name) |> Enum.sort()
          plural? = length(file.schemas) > 1

          "Provides struct and type#{if plural?, do: "s", else: ""} for #{Enum.join(schemas, ", ")}"

        file.schemas == [] ->
          topic = Macro.underscore(file.original_module) |> String.replace("_", " ")
          plural? = length(file.operations) > 1
          "Provides API endpoint#{if plural?, do: "s", else: ""} related to #{topic}"

        :else ->
          topic = Macro.underscore(file.original_module) |> String.replace("_", " ")
          schemas_plural? = length(file.schemas) > 1
          endpoints_plural? = length(file.operations) > 1

          "Provides API endpoint#{if endpoints_plural?, do: "s", else: ""}, struct, and type#{if schemas_plural?, do: "s", else: ""} related to #{topic}"
      end

    moduledoc = "#{header}\n"

    quote do
      @moduledoc unquote(moduledoc)
    end
    |> put_newlines()
  end

  defp render_default_client(%{operations: []}), do: []

  defp render_default_client(file) do
    quote do
      @default_client unquote(file.default_client)
    end
    |> put_newlines()
  end

  defp render_types([]), do: []

  defp render_types(schemas) do
    schemas =
      schemas
      |> Enum.sort_by(fn %Schema{final_type: type} -> type end)
      |> Enum.dedup_by(fn %Schema{fields: fields, final_name: final_name, final_type: final_type} ->
        {fields, final_name, final_type}
      end)

    for %Schema{fields: fields, final_type: type} <- schemas do
      fields = render_type_fields(fields)

      quote do
        @type unquote({type, [], nil}) :: %__MODULE__{
                unquote_splicing(fields)
              }
      end
      |> put_newlines()
    end
  end

  defp render_type_fields(fields) do
    fields
    |> Enum.sort_by(fn {name, _field} -> name end)
    |> Enum.map(fn {name, %Field{nullable: nullable?, required: required?, type: type}} ->
      if nullable? or not required? do
        quote do
          {unquote(String.to_atom(name)), unquote(to_type(type)) | nil}
        end
      else
        quote do
          {unquote(String.to_atom(name)), unquote(to_type(type))}
        end
      end
    end)
  end

  defp render_struct([]), do: []

  defp render_struct(schemas) do
    fields = render_struct_fields(schemas)

    quote do
      defstruct unquote(fields)
    end
    |> put_newlines()
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

    function_clauses =
      schemas
      |> Enum.sort_by(fn %Schema{final_type: type} -> type end)
      |> Enum.dedup_by(fn %Schema{fields: fields, final_name: final_name, final_type: final_type} ->
        {fields, final_name, final_type}
      end)
      |> Enum.map(&render_field_function_clause/1)

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
      typespec = render_operation_typespec(operation)
      function = render_operation_function(operation)

      [docstring, typespec, function]
    end)
    |> List.flatten()
  end

  defp render_operation_docs(operation) do
    options =
      for {name, description, type} <- operation.query_params, reduce: "" do
        options ->
          typespec = to_type(type) |> Macro.to_string()
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

    quote do
      @doc unquote(docs)
    end
  end

  defp render_operation_function(operation) do
    path_parameter_arguments =
      Enum.map(operation.path_params, fn {name, _spec, _type} ->
        {String.to_atom(name), [], nil}
      end)

    body_argument = if operation.body, do: quote(do: body)
    opts_argument = quote do: opts \\ []

    arguments = clean_list([path_parameter_arguments, body_argument, opts_argument])

    client = render_operation_client()
    query = render_operation_query(operation.query_params)
    call = render_operation_call(operation)

    operation_body = clean_list([client, query, call])

    quote do
      def unquote(String.to_atom(operation.name))(unquote_splicing(arguments)) do
        (unquote_splicing(operation_body))
      end
    end
  end

  defp render_operation_typespec(operation) do
    name = String.to_atom(operation.name)

    path_parameter_arguments =
      Enum.map(operation.path_params, fn {_, _, type} ->
        quote(do: unquote(to_type(type)))
      end)

    body_argument = if operation.body, do: quote(do: map)
    opts_argument = quote(do: keyword)

    arguments = clean_list([path_parameter_arguments, body_argument, opts_argument])
    return_type = render_return_type(operation.responses)

    quote do
      @spec unquote(name)(unquote_splicing(arguments)) :: unquote(return_type)
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

  defp render_return_type([]), do: quote(do: :ok)

  defp render_return_type(responses) do
    {success, error} =
      responses
      |> Enum.map(fn {status, type} -> {String.to_integer(status), type} end)
      |> Enum.reject(fn {_status, type} -> is_nil(type) end)
      |> Enum.reject(fn {status, _type} -> status >= 300 and status < 400 end)
      |> Enum.split_with(fn {status, _type} -> status < 300 end)

    ok =
      if length(success) > 0 do
        type = to_type({:union, Enum.map(success, &elem(&1, 1))})
        quote(do: {:ok, unquote(type)})
      else
        quote(do: :ok)
      end

    error =
      if length(error) > 0 do
        type = to_type({:union, Enum.map(error, &elem(&1, 1))})
        quote(do: {:error, unquote(type)})
      else
        quote(do: :error)
      end

    {:|, [], [ok, error]}
  end

  #
  # Helpers
  #

  defp clean_list(nodes) do
    nodes
    |> List.flatten()
    |> Enum.reject(&is_atom/1)
  end

  defp put_multiline_docs(ast_node) do
    pre = fn
      {:doc, meta, children}, acc ->
        {{:doc, meta, [{:__block__, [delimiter: "\"\"\"", indentation: 2], children}]}, acc}

      {:moduledoc, meta, children}, acc ->
        {{:moduledoc, meta, [{:__block__, [delimiter: "\"\"\"", indentation: 2], children}]}, acc}

      node, acc ->
        {node, acc}
    end

    post = fn ast_node, acc -> {ast_node, acc} end

    {ast_node, _acc} = Macro.traverse(ast_node, nil, pre, post)
    ast_node
  end

  defp put_newlines({term, metadata, arguments}) do
    end_of_expression =
      Keyword.get(metadata, :end_of_expression, [])
      |> Keyword.put(:newlines, 2)

    {term, Keyword.put(metadata, :end_of_expression, end_of_expression), arguments}
  end

  #
  # Types
  #

  defp to_type(:boolean), do: quote(do: boolean)
  defp to_type(:integer), do: quote(do: integer)
  defp to_type(:map), do: quote(do: map)
  defp to_type(:number), do: quote(do: number)
  defp to_type(:string), do: quote(do: String.t())
  defp to_type(:unknown), do: quote(do: term)

  defp to_type({:array, type}) do
    inner_type = to_type(type)
    quote(do: [unquote(inner_type)])
  end

  defp to_type({:union, types}) do
    types
    |> Enum.sort(:desc)
    |> Enum.dedup()
    |> Enum.map(&to_type/1)
    |> Enum.reduce(fn type, expression ->
      {:|, [], [type, expression]}
    end)
  end

  defp to_type({module, type}) do
    quote do
      unquote(module).unquote(type)()
    end
  end
end
