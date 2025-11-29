defmodule GithubReview do
  @moduledoc """
  Provides struct and type for a GithubReview
  """

  @type t :: %__MODULE__{
          body: String.t() | nil,
          html_url: String.t(),
          state: String.t(),
          user: GithubUser.t()
        }

  defstruct [:body, :html_url, :state, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      state: {:string, :generic},
      user: {GithubUser, :t}
    ]
  end
end
