defmodule PostCampaignValuesResponseDTO do
  @moduledoc """
  Provides struct and type for a PostCampaignValuesResponseDTO
  """

  @type t :: %__MODULE__{data: PostCampaignValuesResponseDTOData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCampaignValuesResponseDTOData, :t}]
  end
end
