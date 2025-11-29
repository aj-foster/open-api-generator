defmodule SimplePublicObjectInputForCreate do
  @moduledoc """
  Provides struct and type for a SimplePublicObjectInputForCreate
  """

  @type t :: %__MODULE__{
          associations: [PublicAssociationsForObject.t()],
          properties: SimplePublicObjectInputForCreateProperties.t()
        }

  defstruct [:associations, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      associations: [{PublicAssociationsForObject, :t}],
      properties: {SimplePublicObjectInputForCreateProperties, :t}
    ]
  end
end
