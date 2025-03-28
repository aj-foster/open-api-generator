defmodule PatchCampaignMessageResponse do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponse
  """

  @type t :: %__MODULE__{data: PatchCampaignMessageResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchCampaignMessageResponseData, :t}]
  end
end
