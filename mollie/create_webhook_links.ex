defmodule Mollie.CreateWebhookLinks do
  @moduledoc """
  Provides struct and type for a CreateWebhookLinks
  """

  @type t :: %__MODULE__{documentation: Mollie.Url.t(), self: Mollie.Url.t()}

  defstruct [:documentation, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
