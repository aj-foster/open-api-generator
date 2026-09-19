defmodule Mollie.DeleteValuesSalesInvoice do
  @moduledoc """
  Provides struct and type for a DeleteValuesSalesInvoice
  """

  @type t :: %__MODULE__{testmode: boolean | nil}

  defstruct [:testmode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [testmode: {:union, [:boolean, :null]}]
  end
end
