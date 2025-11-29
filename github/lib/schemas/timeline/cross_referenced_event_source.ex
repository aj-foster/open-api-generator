defmodule GitHub.Timeline.CrossReferencedEventSource do
  @moduledoc """
  Provides struct and type for a Timeline.CrossReferencedEventSource
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, issue: GitHub.Issue.t() | nil, type: String.t() | nil}

  defstruct [:__info__, :issue, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issue: {GitHub.Issue, :t}, type: {:string, :generic}]
  end
end
