defmodule OpenAI.RealtimeSessionCreateResponseInputAudioTranscription do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateResponseInputAudioTranscription
  """

  @type t :: %__MODULE__{model: String.t() | nil}

  defstruct [:model]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [model: :string]
  end
end
