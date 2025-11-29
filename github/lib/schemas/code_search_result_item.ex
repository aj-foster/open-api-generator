defmodule GitHub.CodeSearchResultItem do
  @moduledoc """
  Provides struct and type for a CodeSearchResultItem
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          file_size: integer | nil,
          git_url: String.t(),
          html_url: String.t(),
          language: String.t() | nil,
          last_modified_at: DateTime.t() | nil,
          line_numbers: [String.t()] | nil,
          name: String.t(),
          path: String.t(),
          repository: GitHub.Repository.minimal(),
          score: number,
          sha: String.t(),
          text_matches: [GitHub.SearchResultTextMatches.t()] | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :file_size,
    :git_url,
    :html_url,
    :language,
    :last_modified_at,
    :line_numbers,
    :name,
    :path,
    :repository,
    :score,
    :sha,
    :text_matches,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_size: :integer,
      git_url: {:string, :uri},
      html_url: {:string, :uri},
      language: {:union, [{:string, :generic}, :null]},
      last_modified_at: {:string, :date_time},
      line_numbers: [string: :generic],
      name: {:string, :generic},
      path: {:string, :generic},
      repository: {GitHub.Repository, :minimal},
      score: :number,
      sha: {:string, :generic},
      text_matches: [{GitHub.SearchResultTextMatches, :t}],
      url: {:string, :uri}
    ]
  end
end
