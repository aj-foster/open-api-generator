defmodule OpenAI.CreateImageEditRequest do
  @moduledoc """
  Provides struct and type for a CreateImageEditRequest
  """

  @type t :: %__MODULE__{
          image: String.t(),
          mask: String.t() | nil,
          model: String.t() | nil,
          n: integer | nil,
          prompt: String.t(),
          response_format: String.t() | nil,
          size: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [:image, :mask, :model, :n, :prompt, :response_format, :size, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image: {:string, :generic},
      mask: {:string, :generic},
      model: {:union, const: "dall-e-2", string: :generic},
      n: :integer,
      prompt: {:string, :generic},
      response_format: {:enum, ["url", "b64_json"]},
      size: {:enum, ["256x256", "512x512", "1024x1024"]},
      user: {:string, :generic}
    ]
  end
end
