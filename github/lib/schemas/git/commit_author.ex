defmodule GitHub.Git.CommitAuthor do
  @moduledoc """
  Provides struct and type for a Git.CommitAuthor
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, date: DateTime.t(), email: String.t(), name: String.t()}

  defstruct [:__info__, :date, :email, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: {:string, :date_time}, email: {:string, :generic}, name: {:string, :generic}]
  end
end
