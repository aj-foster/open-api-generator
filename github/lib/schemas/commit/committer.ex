defmodule GitHub.Commit.Committer do
  @moduledoc """
  Provides struct and type for a Commit.Committer
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{__info__: map, email: String.t(), name: String.t()}

  defstruct [:__info__, :email, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:simple) do
    [email: {:string, :email}, name: {:string, :generic}]
  end
end
