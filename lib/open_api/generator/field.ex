defmodule OpenAPI.Generator.Field do
  @type t :: %__MODULE__{
          name: String.t(),
          nullable: boolean,
          required: boolean,
          type: term
        }
  defstruct [
    :name,
    :nullable,
    :required,
    :type
  ]
end
