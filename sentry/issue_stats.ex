defmodule IssueStats do
  @moduledoc """
  Provides struct and type for a IssueStats
  """

  @type t :: %__MODULE__{"24h": [[number]] | nil}

  defstruct [:"24h"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["24h": [[:number]]]
  end
end
