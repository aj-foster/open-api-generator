defmodule CreateTranslationRequest do
  @moduledoc """
  Provides struct and type for a CreateTranslationRequest
  """

  @type t :: %__MODULE__{
          file: String.t(),
          model: String.t(),
          prompt: String.t() | nil,
          response_format: String.t() | nil,
          temperature: number | nil
        }

  defstruct [:file, :model, :prompt, :response_format, :temperature]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file: {:string, :generic},
      model: {:union, const: "whisper-1", string: :generic},
      prompt: {:string, :generic},
      response_format: {:enum, ["json", "text", "srt", "verbose_json", "vtt"]},
      temperature: :number
    ]
  end
end
