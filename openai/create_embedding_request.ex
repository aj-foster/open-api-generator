defmodule OpenAI.CreateEmbeddingRequest do
  @moduledoc """
  Provides struct and type for a CreateEmbeddingRequest
  """

  @type t :: %__MODULE__{
          dimensions: integer | nil,
          encoding_format: String.t() | nil,
          input: String.t() | [integer] | [String.t()] | [[integer]],
          model: String.t(),
          user: String.t() | nil
        }

  defstruct [:dimensions, :encoding_format, :input, :model, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dimensions: :integer,
      encoding_format: {:enum, ["float", "base64"]},
      input: {:union, [:string, [:integer], [:string], [[:integer]]]},
      model:
        {:union,
         [
           :string,
           enum: ["text-embedding-ada-002", "text-embedding-3-small", "text-embedding-3-large"]
         ]},
      user: :string
    ]
  end
end
