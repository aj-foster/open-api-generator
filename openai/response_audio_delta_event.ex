defmodule OpenAI.ResponseAudioDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseAudioDeltaEvent
  """

  @type t :: %__MODULE__{delta: String.t(), type: String.t()}

  defstruct [:delta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [delta: :string, type: {:const, "response.audio.delta"}]
  end
end
