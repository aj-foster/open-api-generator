defmodule GetCampaignResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignResponse
  """

  @type t :: %__MODULE__{data: GetCampaignResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCampaignResponseData, :t}]
  end
end
