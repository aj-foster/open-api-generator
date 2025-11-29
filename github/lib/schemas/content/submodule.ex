defmodule GitHub.Content.Submodule do
  @moduledoc """
  Provides struct and type for a Content.Submodule
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.Content.SubmoduleLinks.t(),
          download_url: String.t() | nil,
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          name: String.t(),
          path: String.t(),
          sha: String.t(),
          size: integer,
          submodule_git_url: String.t(),
          type: String.t(),
          url: String.t()
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
    :submodule_git_url,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHub.Content.SubmoduleLinks, :t},
      download_url: {:union, [{:string, :uri}, :null]},
      git_url: {:union, [{:string, :uri}, :null]},
      html_url: {:union, [{:string, :uri}, :null]},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      submodule_git_url: {:string, :uri},
      type: {:const, "submodule"},
      url: {:string, :uri}
    ]
  end
end
