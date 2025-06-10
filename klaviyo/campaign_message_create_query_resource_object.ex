defmodule CampaignMessageCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignMessageCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CampaignMessageCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CampaignMessageCreateQueryResourceObjectAttributes, :t},
      type: {:const, "campaign-message"}
    ]
  end
end
