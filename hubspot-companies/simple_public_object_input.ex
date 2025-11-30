defmodule HubSpot.Companies.SimplePublicObjectInput do
  @moduledoc """
  Provides struct and type for a SimplePublicObjectInput
  """

  @type t :: %__MODULE__{properties: map}

  defstruct [:properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [properties: :map]
  end
end
