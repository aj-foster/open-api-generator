defmodule CampaignCloneQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignCloneQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CampaignCloneQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CampaignCloneQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "campaign"}
    ]
  end
end
