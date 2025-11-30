defmodule Klaviyo.CampaignValuesRequestDTO do
  @moduledoc """
  Provides struct and type for a CampaignValuesRequestDTO
  """

  @type t :: %__MODULE__{data: Klaviyo.CampaignValuesRequestDTOResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignValuesRequestDTOResourceObject, :t}]
  end
end
