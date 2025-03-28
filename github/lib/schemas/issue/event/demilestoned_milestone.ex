defmodule GitHub.Issue.Event.DemilestonedMilestone do
  @moduledoc """
  Provides struct and type for a Issue.Event.DemilestonedMilestone
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, title: String.t()}

  defstruct [:__info__, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [title: {:string, :generic}]
  end
end
