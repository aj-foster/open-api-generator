defmodule ListMembersAddQuery do
  @moduledoc """
  Provides struct and type for a ListMembersAddQuery
  """

  @type t :: %__MODULE__{data: [ListMembersAddQueryData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ListMembersAddQueryData, :t}]]
  end
end
