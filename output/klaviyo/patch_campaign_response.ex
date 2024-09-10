defmodule PatchCampaignResponse do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponse
  """

  @type t :: %__MODULE__{data: PatchCampaignResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchCampaignResponseData, :t}]
  end
end
