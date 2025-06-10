defmodule RealtimeSessionCreateRequestInputAudioTranscription do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateRequestInputAudioTranscription
  """

  @type t :: %__MODULE__{
          language: String.t() | nil,
          model: String.t() | nil,
          prompt: String.t() | nil
        }

  defstruct [:language, :model, :prompt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [language: {:string, :generic}, model: {:string, :generic}, prompt: {:string, :generic}]
  end
end
