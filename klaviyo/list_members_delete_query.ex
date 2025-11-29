defmodule ListMembersDeleteQuery do
  @moduledoc """
  Provides struct and type for a ListMembersDeleteQuery
  """

  @type t :: %__MODULE__{data: [ListMembersDeleteQueryData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ListMembersDeleteQueryData, :t}]]
  end
end
