defmodule SimplifiedShowObject do
  @moduledoc """
  Provides struct and type for a SimplifiedShowObject
  """

  @type t :: %__MODULE__{
          available_markets: [String.t()] | nil,
          copyrights: [CopyrightObject.t()] | nil,
          description: String.t() | nil,
          explicit: boolean | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          html_description: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          is_externally_hosted: boolean | nil,
          languages: [String.t()] | nil,
          media_type: String.t() | nil,
          name: String.t() | nil,
          publisher: String.t() | nil,
          total_episodes: integer | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :available_markets,
    :copyrights,
    :description,
    :explicit,
    :external_urls,
    :href,
    :html_description,
    :id,
    :images,
    :is_externally_hosted,
    :languages,
    :media_type,
    :name,
    :publisher,
    :total_episodes,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      available_markets: [string: :generic],
      copyrights: [{CopyrightObject, :t}],
      description: {:string, :generic},
      explicit: :boolean,
      external_urls: :map,
      href: {:string, :generic},
      html_description: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      is_externally_hosted: :boolean,
      languages: [string: :generic],
      media_type: {:string, :generic},
      name: {:string, :generic},
      publisher: {:string, :generic},
      total_episodes: :integer,
      type: {:const, "show"},
      uri: {:string, :generic}
    ]
  end
end
