defmodule GitHub.FileCommitContent do
  @moduledoc """
  Provides struct and type for a FileCommitContent
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.FileCommitContentLinks.t() | nil,
          download_url: String.t() | nil,
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          name: String.t() | nil,
          path: String.t() | nil,
          sha: String.t() | nil,
          size: integer | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :_links,
    :download_url,
    :git_url,
    :html_url,
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
      _links: {GitHub.FileCommitContentLinks, :t},
      download_url: {:string, :generic},
      git_url: {:string, :generic},
      html_url: {:string, :generic},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      type: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
