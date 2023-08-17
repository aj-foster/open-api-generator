defmodule OpenAPI.State do
  @moduledoc false

  alias OpenAPI.Call
  alias OpenAPI.Spec

  @typedoc "OpenAPI generator state."
  @type t :: %__MODULE__{
          call: Call.t(),
          config: OpenAPI.Config.t(),
          files: [OpenAPI.Renderer.File.t()],
          operations: [OpenAPI.Processor.Operation.t()],
          schemas: %{reference => OpenAPI.Processor.Schema.t()},
          spec: Spec.t() | nil
        }

  @typedoc "Raw Yaml input."
  @type yaml :: map | list

  defstruct [
    :call,
    :config,
    :files,
    :operations,
    :schemas,
    :spec
  ]

  @spec new(Call.t()) :: t
  def new(%Call{} = call) do
    %__MODULE__{
      call: call,
      config: OpenAPI.Config.new(Application.get_env(:oapi_generator, call.profile)),
      files: [],
      operations: [],
      schemas: %{},
      spec: nil
    }
  end
end
