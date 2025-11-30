defmodule Mollie.EntityOrganizationLinks do
  @moduledoc """
  Provides struct and type for a EntityOrganizationLinks
  """

  @type t :: %__MODULE__{
          dashboard: Mollie.Url.t() | nil,
          documentation: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  defstruct [:dashboard, :documentation, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dashboard: {Mollie.Url, :t}, documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
