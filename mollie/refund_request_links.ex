defmodule Mollie.RefundRequestLinks do
  @moduledoc """
  Provides struct and type for a RefundRequestLinks
  """

  @type t :: %__MODULE__{
          documentation: Mollie.Url.t(),
          payment: Mollie.Url.t(),
          self: Mollie.Url.t(),
          settlement: Mollie.UrlNullable.t() | nil
        }

  defstruct [:documentation, :payment, :self, :settlement]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentation: {Mollie.Url, :t},
      payment: {Mollie.Url, :t},
      self: {Mollie.Url, :t},
      settlement: {:union, [{Mollie.UrlNullable, :t}, :null]}
    ]
  end
end
