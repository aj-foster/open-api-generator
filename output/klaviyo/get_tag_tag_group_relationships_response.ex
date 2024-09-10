defmodule GetTagTagGroupRelationshipsResponse do
  @moduledoc """
  Provides struct and type for a GetTagTagGroupRelationshipsResponse
  """

  @type t :: %__MODULE__{data: GetTagTagGroupRelationshipsResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetTagTagGroupRelationshipsResponseData, :t}]
  end
end
