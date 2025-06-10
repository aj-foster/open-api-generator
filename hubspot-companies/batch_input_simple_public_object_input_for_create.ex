defmodule BatchInputSimplePublicObjectInputForCreate do
  @moduledoc """
  Provides struct and type for a BatchInputSimplePublicObjectInputForCreate
  """

  @type t :: %__MODULE__{inputs: [SimplePublicObjectInputForCreate.t()]}

  defstruct [:inputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [inputs: [{SimplePublicObjectInputForCreate, :t}]]
  end
end
