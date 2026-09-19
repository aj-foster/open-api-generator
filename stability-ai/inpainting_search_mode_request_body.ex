defmodule StabilityAI.InpaintingSearchModeRequestBody do
  @moduledoc """
  Provides struct and type for a InpaintingSearchModeRequestBody
  """

  @type t :: %__MODULE__{
          image: binary,
          mode: String.t(),
          negative_prompt: String.t() | nil,
          output_format: String.t() | nil,
          prompt: String.t(),
          search_prompt: String.t(),
          seed: number | nil
        }

  defstruct [:image, :mode, :negative_prompt, :output_format, :prompt, :search_prompt, :seed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image: {:string, "binary"},
      mode: {:const, "search"},
      negative_prompt: :string,
      output_format: {:enum, ["jpeg", "png", "webp"]},
      prompt: :string,
      search_prompt: :string,
      seed: :number
    ]
  end
end
