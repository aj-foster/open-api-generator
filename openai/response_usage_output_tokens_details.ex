defmodule OpenAI.ResponseUsageOutputTokensDetails do
  @moduledoc """
  Provides struct and type for a ResponseUsageOutputTokensDetails
  """

  @type t :: %__MODULE__{reasoning_tokens: integer}

  defstruct [:reasoning_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reasoning_tokens: :integer]
  end
end
