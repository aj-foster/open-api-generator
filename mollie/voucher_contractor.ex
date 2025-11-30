defmodule Mollie.VoucherContractor do
  @moduledoc """
  Provides struct and type for a VoucherContractor
  """

  @type t :: %__MODULE__{
          contractId: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:contractId, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [contractId: {:string, :generic}, id: {:string, :generic}, name: {:string, :generic}]
  end
end
