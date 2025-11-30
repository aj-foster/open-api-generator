defmodule Line.UserProfileResponse do
  @moduledoc """
  Provides struct and type for a UserProfileResponse
  """

  @type t :: %__MODULE__{
          displayName: String.t(),
          language: String.t() | nil,
          pictureUrl: String.t() | nil,
          statusMessage: String.t() | nil,
          userId: String.t()
        }

  defstruct [:displayName, :language, :pictureUrl, :statusMessage, :userId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      displayName: :string,
      language: :string,
      pictureUrl: {:string, "uri"},
      statusMessage: :string,
      userId: :string
    ]
  end
end
