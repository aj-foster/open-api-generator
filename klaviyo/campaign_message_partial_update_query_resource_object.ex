defmodule Klaviyo.CampaignMessagePartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignMessagePartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CampaignMessagePartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CampaignMessagePartialUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "campaign-message"}
    ]
  end
end
