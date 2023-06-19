defmodule OpenAPI.State do
  @moduledoc false

  alias OpenAPI.Call
  alias OpenAPI.Spec

  @type file :: %{
          name: String.t(),
          docstring: String.t(),
          fields: map,
          methods: [term],
          using: [module]
        }

  @typedoc "OpenAPI generator state."
  @type t :: %__MODULE__{
          call: Call.t(),
          operations: [map],
          operation_files: %{optional(module) => file},
          schemas: %{optional(String.t()) => map},
          schema_files: %{optional(module) => file},
          spec: Spec.t() | nil
        }

  @typedoc "Raw Yaml input."
  @type yaml :: map | list

  defstruct [
    :call,
    :config,
    :files,
    :operations,
    :operation_files,
    :schemas,
    :schema_files,
    :spec
  ]

  @spec new(Call.t()) :: t
  def new(%Call{} = call) do
    %__MODULE__{
      call: call,
      config: OpenAPI.Config.new(Application.get_env(:oapi_generator, call.profile)),
      files: %{},
      operations: [],
      operation_files: %{},
      schemas: %{},
      schema_files: %{},
      spec: nil
    }
  end
end
