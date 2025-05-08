defmodule PostCampaignResponse do
  @moduledoc """
  Provides struct and type for a PostCampaignResponse
  """

  @type t :: %__MODULE__{data: PostCampaignResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCampaignResponseData, :t}]
  end
end
