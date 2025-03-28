defmodule CampaignSendJobPartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a CampaignSendJobPartialUpdateQuery
  """

  @type t :: %__MODULE__{data: CampaignSendJobPartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignSendJobPartialUpdateQueryResourceObject, :t}]
  end
end
