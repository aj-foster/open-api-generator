defmodule GithubAuthor do
  @moduledoc """
  Provides struct and type for a GithubAuthor
  """

  @type t :: %__MODULE__{name: String.t(), username: String.t() | nil}

  defstruct [:name, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, username: {:union, [{:string, :generic}, :null]}]
  end
end
