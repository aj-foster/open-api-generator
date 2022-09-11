defmodule OpenAPI.Generator.State do
  @moduledoc false
  alias OpenAPI.Generator.Options
  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          options: Options.t(),
          schemas: [{String.t(), module, Spec.t()}]
        }

  defstruct [
    :options,
    :schemas
  ]
end
