defmodule Klaviyo.GetTagListRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagListRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetTagListRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetTagListRelationshipsResponseCollectionData, :t}]]
  end
end
