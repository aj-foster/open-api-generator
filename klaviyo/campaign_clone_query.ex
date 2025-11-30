defmodule Klaviyo.CampaignCloneQuery do
  @moduledoc """
  Provides struct and type for a CampaignCloneQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CampaignCloneQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignCloneQueryResourceObject, :t}]
  end
end
