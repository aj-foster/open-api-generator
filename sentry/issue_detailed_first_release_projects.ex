defmodule IssueDetailedFirstReleaseProjects do
  @moduledoc """
  Provides struct and type for a IssueDetailedFirstReleaseProjects
  """

  @type t :: %__MODULE__{name: String.t() | nil, slug: String.t() | nil}

  defstruct [:name, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, slug: {:string, :generic}]
  end
end
