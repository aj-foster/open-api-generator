defmodule GetEventProfilesRelationshipListResponse do
  @moduledoc """
  Provides struct and type for a GetEventProfilesRelationshipListResponse
  """

  @type t :: %__MODULE__{data: GetEventProfilesRelationshipListResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetEventProfilesRelationshipListResponseData, :t}]
  end
end
