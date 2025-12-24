defmodule StabilityAI.InpaintingMaskingModeRequestBody do
  @moduledoc """
  Provides struct and type for a InpaintingMaskingModeRequestBody
  """

  @type t :: %__MODULE__{
          image: binary,
          mask: binary | nil,
          mode: String.t(),
          negative_prompt: String.t() | nil,
          output_format: String.t() | nil,
          prompt: String.t(),
          seed: number | nil
        }

  defstruct [:image, :mask, :mode, :negative_prompt, :output_format, :prompt, :seed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image: {:string, "binary"},
      mask: {:string, "binary"},
      mode: {:const, "mask"},
      negative_prompt: :string,
      output_format: {:enum, ["jpeg", "png", "webp"]},
      prompt: :string,
      seed: :number
    ]
  end
end
