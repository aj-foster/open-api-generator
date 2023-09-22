defmodule OpenAPI.Processor.Operation do
  @moduledoc """
  Default plugin for formatting operations

  This module also provides the Operation struct that is used by the renderer.
  """
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Processor.State
  alias OpenAPI.Processor.Type
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec
  alias OpenAPI.Spec.RequestBody, as: RequestBodySpec
  alias OpenAPI.Spec.Response, as: ResponseSpec
  alias OpenAPI.Spec.Schema, as: SchemaSpec
  alias OpenAPI.Spec.Schema.Media, as: MediaSpec

  @typedoc "HTTP method"
  @type method :: :get | :put | :post | :delete | :options | :head | :patch | :trace

  @typedoc "Request content types and their associated schema specs"
  @type request_body_unprocessed :: [{content_type :: String.t(), schema :: SchemaSpec.t()}]

  @typedoc "Request content types and their associated schemas"
  @type request_body :: [{content_type :: String.t(), schema :: Type.t()}]

  @typedoc "Response status codes and their associated schema specs"
  @type response_body_unprocessed :: [
          {status :: integer | :default, schemas :: %{String.t() => SchemaSpec.t()}}
        ]

  @typedoc "Response status codes and their associated schemas"
  @type response_body :: [{status :: integer | :default, schemas :: %{String.t() => Type.t()}}]

  @typedoc "Processed operation data used by the renderer"
  @type t :: %__MODULE__{
          docstring: String.t(),
          function_name: atom,
          module_name: atom,
          request_body: request_body,
          request_method: atom,
          request_path: String.t(),
          request_path_parameters: [Param.t()],
          request_query_parameters: [Param.t()],
          responses: response_body
        }

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

  Default implementation of `c:OpenAPI.Processor.operation_docstring/3`.

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
  @doc default_implementation: true
  @spec docstring(State.t(), OperationSpec.t(), [Param.t()]) :: String.t()
  def docstring(_state, operation, query_params) do
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

    description = if description not in [nil, ""], do: "\n#{description}\n"

    options =
      if length(query_params) > 0 do
        for %Param{description: description, name: name} <- query_params,
            into: "\n## Options\n\n" do
          if description do
            description = String.replace(description, "\n", "\n    ")
            "  * `#{name}`: #{description}\n"
          else
            "  * `#{name}`\n"
          end
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

  @doc """
  Collect request content types and their associated schemas

  Default implementation of `c:OpenAPI.Processor.operation_request_body/2`.
  """
  @doc default_implementation: true
  @spec request_body(State.t(), OperationSpec.t()) :: request_body_unprocessed
  def request_body(_state, %OperationSpec{request_body: %RequestBodySpec{content: content}})
      when is_map(content) do
    Enum.map(content, fn {content_type, %MediaSpec{schema: schema}} -> {content_type, schema} end)
  end

  def request_body(_state, _operation_spec), do: []

  @doc """
  Cast the HTTP method to an atom

  Default implementation of `c:OpenAPI.Processor.operation_request_method/2`.
  """
  @doc default_implementation: true
  @spec request_method(State.t(), OperationSpec.t()) :: method
  def request_method(_state, %OperationSpec{"$oag_path_method": "get"}), do: :get
  def request_method(_state, %OperationSpec{"$oag_path_method": "put"}), do: :put
  def request_method(_state, %OperationSpec{"$oag_path_method": "post"}), do: :post
  def request_method(_state, %OperationSpec{"$oag_path_method": "delete"}), do: :delete
  def request_method(_state, %OperationSpec{"$oag_path_method": "options"}), do: :options
  def request_method(_state, %OperationSpec{"$oag_path_method": "head"}), do: :head
  def request_method(_state, %OperationSpec{"$oag_path_method": "patch"}), do: :patch
  def request_method(_state, %OperationSpec{"$oag_path_method": "trace"}), do: :trace

  @doc """
  Collect response status codes and their associated schemas

  Default implementation of `c:OpenAPI.Processor.operation_response_body/2`.

  In this implementation, all schemas are returned regardless of content type. It is possible for
  the same status code to have multiple schemas, in which case the renderer should compose a
  union type for the response.
  """
  @doc default_implementation: true
  @spec response_body(State.t(), OperationSpec.t()) :: response_body_unprocessed
  def response_body(_state, %OperationSpec{responses: responses}) when is_map(responses) do
    Enum.map(responses, fn {status_or_default, %ResponseSpec{content: content}} ->
      schemas =
        Map.new(content, fn {content_type, %MediaSpec{schema: schema}} ->
          {content_type, schema}
        end)

      {status_or_default, schemas}
    end)
  end
end
