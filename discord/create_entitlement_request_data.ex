defmodule Discord.CreateEntitlementRequestData do
  @moduledoc """
  Provides struct and type for a CreateEntitlementRequestData
  """

  @type t :: %__MODULE__{owner_id: String.t(), owner_type: integer, sku_id: String.t()}

  defstruct [:owner_id, :owner_type, :sku_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      owner_id: {:string, "snowflake"},
      owner_type: {:integer, "int32"},
      sku_id: {:string, "snowflake"}
    ]
  end
end
