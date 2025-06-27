defmodule CreateImageRequest do
  @moduledoc """
  Provides struct and type for a CreateImageRequest
  """

  @type t :: %__MODULE__{
          model: String.t() | nil,
          n: integer | nil,
          prompt: String.t(),
          quality: String.t() | nil,
          response_format: String.t() | nil,
          size: String.t() | nil,
          style: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [:model, :n, :prompt, :quality, :response_format, :size, :style, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      model: {:union, enum: ["dall-e-2", "dall-e-3"], string: :generic},
      n: :integer,
      prompt: {:string, :generic},
      quality: {:enum, ["standard", "hd"]},
      response_format: {:enum, ["url", "b64_json"]},
      size: {:enum, ["256x256", "512x512", "1024x1024", "1792x1024", "1024x1792"]},
      style: {:enum, ["vivid", "natural"]},
      user: {:string, :generic}
    ]
  end
end
