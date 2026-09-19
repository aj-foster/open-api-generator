defmodule HubSpot.Companies.SimplePublicObjectInputForCreate do
  @moduledoc """
  Provides struct and type for a SimplePublicObjectInputForCreate
  """

  @type t :: %__MODULE__{
          associations: [HubSpot.Companies.PublicAssociationsForObject.t()],
          properties: map
        }

  defstruct [:associations, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [associations: [{HubSpot.Companies.PublicAssociationsForObject, :t}], properties: :map]
  end
end
