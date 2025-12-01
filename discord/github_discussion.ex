defmodule Discord.GithubDiscussion do
  @moduledoc """
  Provides struct and type for a GithubDiscussion
  """

  @type t :: %__MODULE__{
          answer_html_url: String.t() | nil,
          body: String.t() | nil,
          html_url: String.t(),
          number: integer,
          title: String.t(),
          user: Discord.GithubUser.t()
        }

  defstruct [:answer_html_url, :body, :html_url, :number, :title, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      answer_html_url: {:union, [{:string, "uri"}, :null]},
      body: {:union, [:string, :null]},
      html_url: {:string, "uri"},
      number: :integer,
      title: :string,
      user: {Discord.GithubUser, :t}
    ]
  end
end
