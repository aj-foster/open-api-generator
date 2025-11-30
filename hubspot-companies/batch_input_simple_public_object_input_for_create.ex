defmodule HubSpot.Companies.BatchInputSimplePublicObjectInputForCreate do
  @moduledoc """
  Provides struct and type for a BatchInputSimplePublicObjectInputForCreate
  """

  @type t :: %__MODULE__{inputs: [HubSpot.Companies.SimplePublicObjectInputForCreate.t()]}

  defstruct [:inputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [inputs: [{HubSpot.Companies.SimplePublicObjectInputForCreate, :t}]]
  end
end
