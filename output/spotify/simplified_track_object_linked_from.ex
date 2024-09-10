defmodule SimplifiedTrackObjectLinkedFrom do
  @moduledoc """
  Provides struct and type for a SimplifiedTrackObjectLinkedFrom
  """

  @type t :: %__MODULE__{
          external_urls: SimplifiedTrackObjectLinkedFromExternalUrls.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:external_urls, :href, :id, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_urls: {SimplifiedTrackObjectLinkedFromExternalUrls, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      type: {:string, :generic},
      uri: {:string, :generic}
    ]
  end
end
