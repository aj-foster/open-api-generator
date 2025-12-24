defmodule OpenAI.ResponseAudioDoneEvent do
  @moduledoc """
  Provides struct and type for a ResponseAudioDoneEvent
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "response.audio.done"}]
  end
end
