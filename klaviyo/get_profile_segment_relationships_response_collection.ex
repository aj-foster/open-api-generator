defmodule Klaviyo.GetProfileSegmentRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetProfileSegmentRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetProfileSegmentRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetProfileSegmentRelationshipsResponseCollectionData, :t}]]
  end
end
