defmodule UpdateVectorStoreRequest do
  @moduledoc """
  Provides struct and type for a UpdateVectorStoreRequest
  """

  @type t :: %__MODULE__{
          expires_after: UpdateVectorStoreRequestExpiresAfter.t() | nil,
          metadata: map | nil,
          name: String.t() | nil
        }

  defstruct [:expires_after, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_after: {UpdateVectorStoreRequestExpiresAfter, :t},
      metadata: :map,
      name: {:string, :generic}
    ]
  end
end
