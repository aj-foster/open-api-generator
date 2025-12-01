defmodule OpenAI.CreateImageEditRequest do
  @moduledoc """
  Provides struct and type for a CreateImageEditRequest
  """

  @type t :: %__MODULE__{
          image: binary,
          mask: binary | nil,
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
      image: {:string, "binary"},
      mask: {:string, "binary"},
      model: {:union, [:string, const: "dall-e-2"]},
      n: :integer,
      prompt: :string,
      response_format: {:enum, ["url", "b64_json"]},
      size: {:enum, ["256x256", "512x512", "1024x1024"]},
      user: :string
    ]
  end
end
