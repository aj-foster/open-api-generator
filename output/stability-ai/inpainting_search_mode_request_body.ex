defmodule InpaintingSearchModeRequestBody do
  @moduledoc """
  Provides struct and type for a InpaintingSearchModeRequestBody
  """

  @type t :: %__MODULE__{
          image: String.t(),
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
      image: {:string, :generic},
      mode: {:const, "search"},
      negative_prompt: {:string, :generic},
      output_format: {:enum, ["jpeg", "png", "webp"]},
      prompt: {:string, :generic},
      search_prompt: {:string, :generic},
      seed: :number
    ]
  end
end
