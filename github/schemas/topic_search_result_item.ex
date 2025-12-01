defmodule GitHub.TopicSearchResultItem do
  @moduledoc """
  Provides struct and type for a TopicSearchResultItem
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          aliases: [map] | nil,
          created_at: DateTime.t(),
          created_by: String.t() | nil,
          curated: boolean,
          description: String.t() | nil,
          display_name: String.t() | nil,
          featured: boolean,
          logo_url: String.t() | nil,
          name: String.t(),
          related: [map] | nil,
          released: String.t() | nil,
          repository_count: integer | nil,
          score: number,
          short_description: String.t() | nil,
          text_matches: [GitHub.SearchResultTextMatches.t()] | nil,
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :aliases,
    :created_at,
    :created_by,
    :curated,
    :description,
    :display_name,
    :featured,
    :logo_url,
    :name,
    :related,
    :released,
    :repository_count,
    :score,
    :short_description,
    :text_matches,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aliases: {:union, [[:map], :null]},
      created_at: {:string, "date-time"},
      created_by: {:union, [:string, :null]},
      curated: :boolean,
      description: {:union, [:string, :null]},
      display_name: {:union, [:string, :null]},
      featured: :boolean,
      logo_url: {:union, [{:string, "uri"}, :null]},
      name: :string,
      related: {:union, [[:map], :null]},
      released: {:union, [:string, :null]},
      repository_count: {:union, [:integer, :null]},
      score: :number,
      short_description: {:union, [:string, :null]},
      text_matches: [{GitHub.SearchResultTextMatches, :t}],
      updated_at: {:string, "date-time"}
    ]
  end
end
