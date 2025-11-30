defmodule OpenAI.MessageObjectIncompleteDetails do
  @moduledoc """
  Provides struct and type for a MessageObjectIncompleteDetails
  """

  @type t :: %__MODULE__{reason: String.t()}

  defstruct [:reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      reason:
        {:enum, ["content_filter", "max_tokens", "run_cancelled", "run_expired", "run_failed"]}
    ]
  end
end
