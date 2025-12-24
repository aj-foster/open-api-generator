defmodule Klaviyo.CampaignPartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignPartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CampaignPartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CampaignPartialUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "campaign"}
    ]
  end
end
