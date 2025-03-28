defmodule CampaignSendJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CampaignSendJobCreateQuery
  """

  @type t :: %__MODULE__{data: CampaignSendJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignSendJobCreateQueryResourceObject, :t}]
  end
end
