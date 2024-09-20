defmodule PostCampaignMessageResponse do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponse
  """

  @type t :: %__MODULE__{data: PostCampaignMessageResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCampaignMessageResponseData, :t}]
  end
end
