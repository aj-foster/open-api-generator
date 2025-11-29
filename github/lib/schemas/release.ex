defmodule GitHub.Release do
  @moduledoc """
  Provides struct and type for a Release
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          assets: [GitHub.Release.Asset.t()],
          assets_url: String.t(),
          author: GitHub.User.simple(),
          body: String.t() | nil,
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          created_at: DateTime.t(),
          discussion_url: String.t() | nil,
          draft: boolean,
          html_url: String.t(),
          id: integer,
          mentions_count: integer | nil,
          name: String.t() | nil,
          node_id: String.t(),
          prerelease: boolean,
          published_at: DateTime.t() | nil,
          reactions: GitHub.Reaction.Rollup.t() | nil,
          tag_name: String.t(),
          tarball_url: String.t() | nil,
          target_commitish: String.t(),
          upload_url: String.t(),
          url: String.t(),
          zipball_url: String.t() | nil
        }

  defstruct [
    :__info__,
    :assets,
    :assets_url,
    :author,
    :body,
    :body_html,
    :body_text,
    :created_at,
    :discussion_url,
    :draft,
    :html_url,
    :id,
    :mentions_count,
    :name,
    :node_id,
    :prerelease,
    :published_at,
    :reactions,
    :tag_name,
    :tarball_url,
    :target_commitish,
    :upload_url,
    :url,
    :zipball_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assets: [{GitHub.Release.Asset, :t}],
      assets_url: {:string, :uri},
      author: {GitHub.User, :simple},
      body: {:union, [{:string, :generic}, :null]},
      body_html: {:string, :generic},
      body_text: {:string, :generic},
      created_at: {:string, :date_time},
      discussion_url: {:string, :uri},
      draft: :boolean,
      html_url: {:string, :uri},
      id: :integer,
      mentions_count: :integer,
      name: {:union, [{:string, :generic}, :null]},
      node_id: {:string, :generic},
      prerelease: :boolean,
      published_at: {:union, [{:string, :date_time}, :null]},
      reactions: {GitHub.Reaction.Rollup, :t},
      tag_name: {:string, :generic},
      tarball_url: {:union, [{:string, :uri}, :null]},
      target_commitish: {:string, :generic},
      upload_url: {:string, :generic},
      url: {:string, :uri},
      zipball_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end
