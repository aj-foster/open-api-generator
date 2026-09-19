defmodule Klaviyo.GetTagTagGroupRelationshipsResponse do
  @moduledoc """
  Provides struct and type for a GetTagTagGroupRelationshipsResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetTagTagGroupRelationshipsResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetTagTagGroupRelationshipsResponseData, :t}]
  end
end
