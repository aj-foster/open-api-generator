defmodule OpenAPI.Processor.Operation do
  @moduledoc """
  Default plugin for formatting operations

  This module also provides the Operation struct that is used by the renderer.
  """
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Spec.Path.Operation

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
  Create the contents of an @doc string for the given operation
  """
  @spec docstring(Operation.t(), [Param.t()]) :: String.t()
  def docstring(operation, query_params) do
    %Operation{
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
        for %Param{description: description, name: name, value_type: type} <- query_params,
            into: "\n## Options\n\n" do
          "  * `#{name}` (#{type}): #{description}\n"
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
