defmodule CampaignValuesRequestDTOResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignValuesRequestDTOResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CampaignValuesRequestDTOResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CampaignValuesRequestDTOResourceObjectAttributes, :t},
      type: {:const, "campaign-values-report"}
    ]
  end
end
