defmodule OpenAI.ResponseIncompleteDetails do
  @moduledoc """
  Provides struct and type for a ResponseIncompleteDetails
  """

  @type t :: %__MODULE__{reason: String.t() | nil}

  defstruct [:reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reason: {:enum, ["max_output_tokens", "content_filter"]}]
  end
end
