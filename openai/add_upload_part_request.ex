defmodule OpenAI.AddUploadPartRequest do
  @moduledoc """
  Provides struct and type for a AddUploadPartRequest
  """

  @type t :: %__MODULE__{data: binary}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {:string, "binary"}]
  end
end
