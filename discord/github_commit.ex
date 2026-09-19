defmodule Discord.GithubCommit do
  @moduledoc """
  Provides struct and type for a GithubCommit
  """

  @type t :: %__MODULE__{
          author: Discord.GithubAuthor.t(),
          id: String.t(),
          message: String.t(),
          url: String.t()
        }

  defstruct [:author, :id, :message, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [author: {Discord.GithubAuthor, :t}, id: :string, message: :string, url: {:string, "uri"}]
  end
end
