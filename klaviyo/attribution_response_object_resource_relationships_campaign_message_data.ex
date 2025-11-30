defmodule Klaviyo.AttributionResponseObjectResourceRelationshipsCampaignMessageData do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsCampaignMessageData
  """

  @type t :: %__MODULE__{id: String.t(), type: String.t()}

  defstruct [:id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, type: {:const, "campaign-message"}]
  end
end
