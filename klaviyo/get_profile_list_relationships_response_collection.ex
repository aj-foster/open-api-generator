defmodule Klaviyo.GetProfileListRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetProfileListRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetProfileListRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetProfileListRelationshipsResponseCollectionData, :t}]]
  end
end
