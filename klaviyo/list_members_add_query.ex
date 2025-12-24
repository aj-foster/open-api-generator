defmodule Klaviyo.ListMembersAddQuery do
  @moduledoc """
  Provides struct and type for a ListMembersAddQuery
  """

  @type t :: %__MODULE__{data: [Klaviyo.ListMembersAddQueryData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.ListMembersAddQueryData, :t}]]
  end
end
