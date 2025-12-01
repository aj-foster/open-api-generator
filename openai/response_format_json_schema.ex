defmodule OpenAI.ResponseFormatJsonSchema do
  @moduledoc """
  Provides struct and type for a ResponseFormatJsonSchema
  """

  @type t :: %__MODULE__{json_schema: OpenAI.JSONSchema.t(), type: String.t()}

  defstruct [:json_schema, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [json_schema: {OpenAI.JSONSchema, :t}, type: {:const, "json_schema"}]
  end
end
