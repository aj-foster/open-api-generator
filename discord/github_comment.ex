defmodule Discord.GithubComment do
  @moduledoc """
  Provides struct and type for a GithubComment
  """

  @type t :: %__MODULE__{
          body: String.t(),
          commit_id: String.t() | nil,
          html_url: String.t(),
          id: integer,
          user: Discord.GithubUser.t()
        }

  defstruct [:body, :commit_id, :html_url, :id, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: :string,
      commit_id: {:union, [:string, :null]},
      html_url: {:string, "uri"},
      id: :integer,
      user: {Discord.GithubUser, :t}
    ]
  end
end
