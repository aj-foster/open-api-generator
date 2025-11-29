defmodule CreateEntitlementRequestData do
  @moduledoc """
  Provides struct and type for a CreateEntitlementRequestData
  """

  @type t :: %__MODULE__{owner_id: String.t(), owner_type: integer, sku_id: String.t()}

  defstruct [:owner_id, :owner_type, :sku_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [owner_id: {:string, :generic}, owner_type: :integer, sku_id: {:string, :generic}]
  end
end
