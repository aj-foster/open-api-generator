defmodule Klaviyo.ListMembersDeleteQuery do
  @moduledoc """
  Provides struct and type for a ListMembersDeleteQuery
  """

  @type t :: %__MODULE__{data: [Klaviyo.ListMembersDeleteQueryData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.ListMembersDeleteQueryData, :t}]]
  end
end
