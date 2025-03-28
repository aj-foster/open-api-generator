defmodule PublicUserObject do
  @moduledoc """
  Provides struct and type for a PublicUserObject
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          external_urls: PublicUserObjectExternalUrls.t() | nil,
          followers: PublicUserObjectFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:display_name, :external_urls, :followers, :href, :id, :images, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: {:string, :generic},
      external_urls: {PublicUserObjectExternalUrls, :t},
      followers: {PublicUserObjectFollowers, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      type: {:const, "user"},
      uri: {:string, :generic}
    ]
  end
end
