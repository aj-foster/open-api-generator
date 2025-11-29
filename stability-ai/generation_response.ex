defmodule GenerationResponse do
  @moduledoc """
  Provides struct and type for a GenerationResponse
  """

  @type json_resp :: %__MODULE__{artifacts: [Image.t()] | nil}

  defstruct [:artifacts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [artifacts: [{Image, :t}]]
  end
end
