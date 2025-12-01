defmodule HubSpot.Companies.BatchReadInputSimplePublicObjectId do
  @moduledoc """
  Provides struct and type for a BatchReadInputSimplePublicObjectId
  """

  @type t :: %__MODULE__{
          idProperty: String.t() | nil,
          inputs: [HubSpot.Companies.SimplePublicObjectId.t()],
          properties: [String.t()],
          propertiesWithHistory: [String.t()]
        }

  defstruct [:idProperty, :inputs, :properties, :propertiesWithHistory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      idProperty: :string,
      inputs: [{HubSpot.Companies.SimplePublicObjectId, :t}],
      properties: [:string],
      propertiesWithHistory: [:string]
    ]
  end
end
