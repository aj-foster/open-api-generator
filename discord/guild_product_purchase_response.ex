defmodule GuildProductPurchaseResponse do
  @moduledoc """
  Provides struct and type for a GuildProductPurchaseResponse
  """

  @type t :: %__MODULE__{listing_id: String.t(), product_name: String.t()}

  defstruct [:listing_id, :product_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [listing_id: {:string, :generic}, product_name: {:string, :generic}]
  end
end
