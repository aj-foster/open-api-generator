defmodule Klaviyo.CampaignMessagePartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a CampaignMessagePartialUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CampaignMessagePartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignMessagePartialUpdateQueryResourceObject, :t}]
  end
end
