defmodule OpenAPI.Processor.Operation do
  @moduledoc """
  Default plugin for formatting operations

  This module also provides the Operation struct that is used by the renderer.
  """
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec

  defstruct [
    :docstring,
    :function_name,
    :module_name,
    :request_body,
    :request_method,
    :request_path,
    :request_path_parameters,
    :request_query_parameters,
    :responses
  ]

  @doc """
  Create the contents of an `@doc` string for the given operation

  The docstring constructed by this function will contain a summary line provided by the operation
  summary (if available) or the request method and path otherwise. It will incorporate the
  operation description (if available) and link to any included external documentation. Finally,
  all query parameters (which are part of the `opts` argument) are documented.

      @doc \"\"\"
      Summary of the operation or method and path

      Description of the operation, which generally provides more information.

      ## Options

        * `param`: query parameter description

      ## Resources

        * [External Doc Description](link to external documentation)

      \"\"\"
  """
  @spec docstring(OperationSpec.t(), [Param.t()]) :: String.t()
  def docstring(operation, query_params) do
    %OperationSpec{
      "$oag_path": request_path,
      "$oag_path_method": request_method,
      description: description,
      external_docs: external_docs,
      summary: summary
    } = operation

    summary =
      if summary do
        "#{summary}\n"
      else
        "#{request_method} `#{request_path}`\n"
      end

    description = if description, do: "\n#{description}\n"

    options =
      if length(query_params) > 0 do
        for %Param{description: description, name: name} <- query_params,
            into: "\n## Options\n\n" do
          "  * `#{name}`: #{description}\n"
        end
      end

    resources =
      if external_docs && external_docs.url do
        if external_docs.description do
          """

          ## Resources

            * [#{external_docs.description}](#{external_docs.url})
          """
        else
          """

          ## Resources

            * [Documentation](#{external_docs.url})
          """
        end
      end

    if options || resources do
      "#{summary}#{description}#{options}#{resources}\n"
    else
      "#{summary}#{description}"
    end
  end
end
