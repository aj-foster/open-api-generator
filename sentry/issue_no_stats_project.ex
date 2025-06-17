defmodule IssueNoStatsProject do
  @moduledoc """
  Provides struct and type for a IssueNoStatsProject
  """

  @type t :: %__MODULE__{id: String.t() | nil, name: String.t() | nil, slug: String.t() | nil}

  defstruct [:id, :name, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, name: {:string, :generic}, slug: {:string, :generic}]
  end
end
