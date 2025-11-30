defmodule OpenAI.UpdateVectorStoreRequest do
  @moduledoc """
  Provides struct and type for a UpdateVectorStoreRequest
  """

  @type t :: %__MODULE__{
          expires_after: OpenAI.UpdateVectorStoreRequestExpiresAfter.t() | nil,
          metadata: map | nil,
          name: String.t() | nil
        }

  defstruct [:expires_after, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_after: {OpenAI.UpdateVectorStoreRequestExpiresAfter, :t},
      metadata: :map,
      name: :string
    ]
  end
end
