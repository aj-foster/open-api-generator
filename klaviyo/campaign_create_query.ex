defmodule Klaviyo.CampaignCreateQuery do
  @moduledoc """
  Provides struct and type for a CampaignCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CampaignCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignCreateQueryResourceObject, :t}]
  end
end
