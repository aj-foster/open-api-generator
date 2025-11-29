defmodule IssueDetailedStats do
  @moduledoc """
  Provides struct and type for a IssueDetailedStats
  """

  @type t :: %__MODULE__{"24h": [[number]] | nil, "30d": [[number]] | nil}

  defstruct [:"24h", :"30d"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["24h": [[:number]], "30d": [[:number]]]
  end
end
