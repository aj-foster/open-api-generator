defmodule OpenAPI.Processor do
  @moduledoc """
  Phase two of code generation

  The **process** phase begins with a decoded API description from the **read** phase. It may
  represent the contents of one or more files, including one or more root descriptions if
  supplemental files were used.

  This library takes an "operation first" mindset when processing the description. Schemas are
  ignored until they are referenced by an operation (ex. as a response body). It is the job of
  this phase to observe all of the operations and their referenced schemas, process them into
  data structures more relevant to code generation, and prepare the data for rendering.

  ## Customization

  At several points during code generation, it may be useful to customize the behaviour of the
  processor. For this purpose, this module is a Behaviour with most of its critical logic
  implemented as optional callbacks.
  """

  @doc """
  Run the processing phase of the code generator

  This functions is used by the main `OpenAPI` module. It is unlikely that you will call this
  function directly, unless you are reimplementing one of the core functions. If this happens,
  please share your use-case with the maintainers; a plugin might be warranted.
  """
  alias OpenAPI.Processor.State

  @spec run(OpenAPI.State.t()) :: OpenAPI.State.t()
  def run(state) do
    state
    |> State.new()
    |> IO.inspect(pretty: true, syntax_colors: IO.ANSI.syntax_colors())
  end

  #
  # Callbacks
  #

  defmacro __using__(_opts) do
    quote do
      defdelegate include_schema?(state, schema), to: OpenAPI.Processor
      defoverridable include_schema?: 2
    end
  end

  @optional_callbacks include_schema?: 2

  @doc """
  Whether to render the given schema in the generated code

  If this function returns `false`, the schema will not appear in the generated code (unless it
  passes this test when presented in another context) and a plain `map` will be used as its type.
  """
  @callback include_schema?(State.t(), OpenAPI.Spec.Schema.t()) :: boolean

  @spec include_schema?(State.t(), OpenAPI.Spec.Schema.t()) :: boolean
  def include_schema?(state, schema) do
    not OpenAPI.Processor.Ignore.ignored?(state, schema)
  end
end
