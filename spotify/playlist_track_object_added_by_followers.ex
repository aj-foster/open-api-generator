defmodule PlaylistTrackObjectAddedByFollowers do
  @moduledoc """
  Provides struct and type for a PlaylistTrackObjectAddedByFollowers
  """

  @type t :: %__MODULE__{href: String.t() | nil, total: integer | nil}

  defstruct [:href, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: {:string, :generic}, total: :integer]
  end
end
