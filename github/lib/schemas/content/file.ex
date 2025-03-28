defmodule GitHub.Content.File do
  @moduledoc """
  Provides struct and type for a Content.File
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.Content.FileLinks.t(),
          content: String.t(),
          download_url: String.t() | nil,
          encoding: String.t(),
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          name: String.t(),
          path: String.t(),
          sha: String.t(),
          size: integer,
          submodule_git_url: String.t() | nil,
          target: String.t() | nil,
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
    :name,
    :path,
    :sha,
    :size,
    :submodule_git_url,
    :target,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHub.Content.FileLinks, :t},
      content: {:string, :generic},
      download_url: {:union, [{:string, :uri}, :null]},
      encoding: {:string, :generic},
      git_url: {:union, [{:string, :uri}, :null]},
      html_url: {:union, [{:string, :uri}, :null]},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      submodule_git_url: {:string, :generic},
      target: {:string, :generic},
      type: {:const, "file"},
      url: {:string, :uri}
    ]
  end
end
