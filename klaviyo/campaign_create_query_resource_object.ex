defmodule CampaignCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CampaignCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {CampaignCreateQueryResourceObjectAttributes, :t}, type: {:const, "campaign"}]
  end
end
