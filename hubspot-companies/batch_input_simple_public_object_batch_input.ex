defmodule BatchInputSimplePublicObjectBatchInput do
  @moduledoc """
  Provides struct and type for a BatchInputSimplePublicObjectBatchInput
  """

  @type t :: %__MODULE__{inputs: [SimplePublicObjectBatchInput.t()]}

  defstruct [:inputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [inputs: [{SimplePublicObjectBatchInput, :t}]]
  end
end
