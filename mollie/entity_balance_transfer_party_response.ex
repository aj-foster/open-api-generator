defmodule Mollie.EntityBalanceTransferPartyResponse do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransferPartyResponse
  """

  @type t :: %__MODULE__{description: String.t(), id: String.t(), type: String.t()}

  defstruct [:description, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, id: :string, type: {:const, "organization"}]
  end
end
