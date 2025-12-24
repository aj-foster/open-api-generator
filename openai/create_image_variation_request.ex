defmodule OpenAI.CreateImageVariationRequest do
  @moduledoc """
  Provides struct and type for a CreateImageVariationRequest
  """

  @type t :: %__MODULE__{
          image: binary,
          model: String.t() | nil,
          n: integer | nil,
          response_format: String.t() | nil,
          size: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [:image, :model, :n, :response_format, :size, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image: {:string, "binary"},
      model: {:union, [:string, const: "dall-e-2"]},
      n: :integer,
      response_format: {:enum, ["url", "b64_json"]},
      size: {:enum, ["256x256", "512x512", "1024x1024"]},
      user: :string
    ]
  end
end
