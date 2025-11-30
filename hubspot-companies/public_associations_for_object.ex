defmodule HubSpot.Companies.PublicAssociationsForObject do
  @moduledoc """
  Provides struct and type for a PublicAssociationsForObject
  """

  @type t :: %__MODULE__{
          to: HubSpot.Companies.PublicObjectId.t(),
          types: [HubSpot.Companies.AssociationSpec.t()]
        }

  defstruct [:to, :types]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [to: {HubSpot.Companies.PublicObjectId, :t}, types: [{HubSpot.Companies.AssociationSpec, :t}]]
  end
end
