defmodule GithubRelease do
  @moduledoc """
  Provides struct and type for a GithubRelease
  """

  @type t :: %__MODULE__{
          author: GithubUser.t(),
          html_url: String.t(),
          id: integer,
          tag_name: String.t()
        }

  defstruct [:author, :html_url, :id, :tag_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {GithubUser, :t},
      html_url: {:string, :uri},
      id: :integer,
      tag_name: {:string, :generic}
    ]
  end
end
