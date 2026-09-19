defmodule Mollie.MandateRequestLinks do
  @moduledoc """
  Provides struct and type for a MandateRequestLinks
  """

  @type t :: %__MODULE__{
          customer: Mollie.Url.t(),
          documentation: Mollie.Url.t(),
          self: Mollie.Url.t()
        }

  defstruct [:customer, :documentation, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {Mollie.Url, :t}, documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
