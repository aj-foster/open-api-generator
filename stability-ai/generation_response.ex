defmodule StabilityAI.GenerationResponse do
  @moduledoc """
  Provides struct and type for a GenerationResponse
  """

  @type json_resp :: %__MODULE__{artifacts: [StabilityAI.Image.t()] | nil}

  defstruct [:artifacts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [artifacts: [{StabilityAI.Image, :t}]]
  end
end
