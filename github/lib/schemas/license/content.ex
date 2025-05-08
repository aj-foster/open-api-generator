defmodule GitHub.License.Content do
  @moduledoc """
  Provides struct and type for a License.Content
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.License.ContentLinks.t(),
          content: String.t(),
          download_url: String.t() | nil,
          encoding: String.t(),
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          license: GitHub.License.simple() | nil,
          name: String.t(),
          path: String.t(),
          sha: String.t(),
          size: integer,
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :_links,
    :content,
    :download_url,
    :encoding,
    :git_url,
    :html_url,
    :license,
    :name,
    :path,
    :sha,
    :size,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHub.License.ContentLinks, :t},
      content: {:string, :generic},
      download_url: {:union, [{:string, :uri}, :null]},
      encoding: {:string, :generic},
      git_url: {:union, [{:string, :uri}, :null]},
      html_url: {:union, [{:string, :uri}, :null]},
      license: {:union, [{GitHub.License, :simple}, :null]},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      type: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
