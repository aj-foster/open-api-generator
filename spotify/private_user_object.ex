defmodule PrivateUserObject do
  @moduledoc """
  Provides struct and type for a PrivateUserObject
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          display_name: String.t() | nil,
          email: String.t() | nil,
          explicit_content: PrivateUserObjectExplicitContent.t() | nil,
          external_urls: PrivateUserObjectExternalUrls.t() | nil,
          followers: PrivateUserObjectFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          product: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :country,
    :display_name,
    :email,
    :explicit_content,
    :external_urls,
    :followers,
    :href,
    :id,
    :images,
    :product,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      country: {:string, :generic},
      display_name: {:string, :generic},
      email: {:string, :generic},
      explicit_content: {PrivateUserObjectExplicitContent, :t},
      external_urls: {PrivateUserObjectExternalUrls, :t},
      followers: {PrivateUserObjectFollowers, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      product: {:string, :generic},
      type: {:string, :generic},
      uri: {:string, :generic}
    ]
  end
end
