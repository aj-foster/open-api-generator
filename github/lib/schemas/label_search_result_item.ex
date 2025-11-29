defmodule GitHub.LabelSearchResultItem do
  @moduledoc """
  Provides struct and type for a LabelSearchResultItem
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          color: String.t(),
          default: boolean,
          description: String.t() | nil,
          id: integer,
          name: String.t(),
          node_id: String.t(),
          score: number,
          text_matches: [GitHub.SearchResultTextMatches.t()] | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :color,
    :default,
    :description,
    :id,
    :name,
    :node_id,
    :score,
    :text_matches,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: {:string, :generic},
      default: :boolean,
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      score: :number,
      text_matches: [{GitHub.SearchResultTextMatches, :t}],
      url: {:string, :uri}
    ]
  end
end
