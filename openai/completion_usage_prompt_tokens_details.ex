defmodule OpenAI.CompletionUsagePromptTokensDetails do
  @moduledoc """
  Provides struct and type for a CompletionUsagePromptTokensDetails
  """

  @type t :: %__MODULE__{audio_tokens: integer | nil, cached_tokens: integer | nil}

  defstruct [:audio_tokens, :cached_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [audio_tokens: :integer, cached_tokens: :integer]
  end
end
