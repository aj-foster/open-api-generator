defmodule GitHub.Issue.Event.RenamedRename do
  @moduledoc """
  Provides struct and type for a Issue.Event.RenamedRename
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, from: String.t(), to: String.t()}

  defstruct [:__info__, :from, :to]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [from: {:string, :generic}, to: {:string, :generic}]
  end
end
