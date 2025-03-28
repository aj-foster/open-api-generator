defmodule GithubRepository do
  @moduledoc """
  Provides struct and type for a GithubRepository
  """

  @type t :: %__MODULE__{
          full_name: String.t(),
          html_url: String.t(),
          id: integer,
          name: String.t()
        }

  defstruct [:full_name, :html_url, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      full_name: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      name: {:string, :generic}
    ]
  end
end
