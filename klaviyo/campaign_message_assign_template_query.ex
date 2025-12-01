defmodule Klaviyo.CampaignMessageAssignTemplateQuery do
  @moduledoc """
  Provides struct and type for a CampaignMessageAssignTemplateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CampaignMessageAssignTemplateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignMessageAssignTemplateQueryResourceObject, :t}]
  end
end
