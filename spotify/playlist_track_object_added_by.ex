defmodule PlaylistTrackObjectAddedBy do
  @moduledoc """
  Provides struct and type for a PlaylistTrackObjectAddedBy
  """

  @type t :: %__MODULE__{
          external_urls: PlaylistTrackObjectAddedByExternalUrls.t() | nil,
          followers: PlaylistTrackObjectAddedByFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:external_urls, :followers, :href, :id, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_urls: {PlaylistTrackObjectAddedByExternalUrls, :t},
      followers: {PlaylistTrackObjectAddedByFollowers, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      type: {:const, "user"},
      uri: {:string, :generic}
    ]
  end
end
