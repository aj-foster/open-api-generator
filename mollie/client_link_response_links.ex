defmodule Mollie.ClientLinkResponseLinks do
  @moduledoc """
  Provides struct and type for a ClientLinkResponseLinks
  """

  @type t :: %__MODULE__{
          clientLink: Mollie.Url.t() | nil,
          documentation: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  defstruct [:clientLink, :documentation, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [clientLink: {Mollie.Url, :t}, documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
