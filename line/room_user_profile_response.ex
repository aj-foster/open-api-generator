defmodule RoomUserProfileResponse do
  @moduledoc """
  Provides struct and type for a RoomUserProfileResponse
  """

  @type t :: %__MODULE__{
          displayName: String.t(),
          pictureUrl: String.t() | nil,
          userId: String.t()
        }

  defstruct [:displayName, :pictureUrl, :userId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [displayName: {:string, :generic}, pictureUrl: {:string, :uri}, userId: {:string, :generic}]
  end
end
