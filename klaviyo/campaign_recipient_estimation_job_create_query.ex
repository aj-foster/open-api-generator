defmodule Klaviyo.CampaignRecipientEstimationJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CampaignRecipientEstimationJobCreateQuery
  """

  @type t :: %__MODULE__{
          data: Klaviyo.CampaignRecipientEstimationJobCreateQueryResourceObject.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignRecipientEstimationJobCreateQueryResourceObject, :t}]
  end
end
