defmodule Discord.GithubIssue do
  @moduledoc """
  Provides struct and type for a GithubIssue
  """

  @type t :: %__MODULE__{
          body: String.t() | nil,
          html_url: String.t(),
          id: integer,
          number: integer,
          pull_request: map | nil,
          title: String.t(),
          user: Discord.GithubUser.t()
        }

  defstruct [:body, :html_url, :id, :number, :pull_request, :title, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: {:union, [:string, :null]},
      html_url: {:string, "uri"},
      id: :integer,
      number: :integer,
      pull_request: :map,
      title: :string,
      user: {Discord.GithubUser, :t}
    ]
  end
end
