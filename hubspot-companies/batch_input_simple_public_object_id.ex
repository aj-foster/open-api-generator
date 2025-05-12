defmodule BatchInputSimplePublicObjectId do
  @moduledoc """
  Provides struct and type for a BatchInputSimplePublicObjectId
  """

  @type t :: %__MODULE__{inputs: [SimplePublicObjectId.t()]}

  defstruct [:inputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [inputs: [{SimplePublicObjectId, :t}]]
  end
end
