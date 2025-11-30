defmodule GitHub.Git.CommitCommitter do
  @moduledoc """
  Provides struct and type for a Git.CommitCommitter
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, date: DateTime.t(), email: String.t(), name: String.t()}

  defstruct [:__info__, :date, :email, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: {:string, "date-time"}, email: :string, name: :string]
  end
end
