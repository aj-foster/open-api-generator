defmodule MinimalCommit do
  @moduledoc """
  Provides struct and type for a MinimalCommit
  """

  @type t :: %__MODULE__{dateCreated: DateTime.t(), id: String.t(), message: String.t() | nil}

  defstruct [:dateCreated, :id, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dateCreated: {:string, :date_time}, id: {:string, :generic}, message: {:string, :generic}]
  end
end
