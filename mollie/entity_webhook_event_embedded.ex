defmodule Mollie.EntityWebhookEventEmbedded do
  @moduledoc """
  Provides struct and type for a EntityWebhookEventEmbedded
  """

  @type t :: %__MODULE__{
          entity: Mollie.PaymentLinkResponse.t() | Mollie.ProfileResponse.t() | nil
        }

  defstruct [:entity]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entity: {:union, [{Mollie.PaymentLinkResponse, :t}, {Mollie.ProfileResponse, :t}]}]
  end
end
