defmodule CampaignCreateQueryResourceObjectAttributesCampaignMessages do
  @moduledoc """
  Provides struct and type for a CampaignCreateQueryResourceObjectAttributesCampaignMessages
  """

  @type t :: %__MODULE__{data: [CampaignMessageCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CampaignMessageCreateQueryResourceObject, :t}]]
  end
end
