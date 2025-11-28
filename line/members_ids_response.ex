defmodule MembersIdsResponse do
  @moduledoc """
  Provides struct and type for a MembersIdsResponse
  """

  @type t :: %__MODULE__{memberIds: [String.t()], next: String.t() | nil}

  defstruct [:memberIds, :next]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [memberIds: [string: :generic], next: {:string, :generic}]
  end
end
