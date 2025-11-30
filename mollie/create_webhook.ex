defmodule Mollie.CreateWebhook do
  @moduledoc """
  Provides struct and type for a CreateWebhook
  """

  @type t :: %__MODULE__{
          _links: Mollie.CreateWebhookLinks.t(),
          createdAt: String.t(),
          eventTypes: [String.t()],
          id: String.t(),
          mode: String.t(),
          name: String.t(),
          profileId: String.t() | nil,
          resource: String.t(),
          status: String.t(),
          url: String.t(),
          webhookSecret: String.t()
        }

  defstruct [
    :_links,
    :createdAt,
    :eventTypes,
    :id,
    :mode,
    :name,
    :profileId,
    :resource,
    :status,
    :url,
    :webhookSecret
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.CreateWebhookLinks, :t},
      createdAt: :string,
      eventTypes: [
        enum: [
          "payment-link.paid",
          "balance-transaction.created",
          "sales-invoice.created",
          "sales-invoice.issued",
          "sales-invoice.canceled",
          "sales-invoice.paid",
          "*"
        ]
      ],
      id: :string,
      mode: {:enum, ["live", "test"]},
      name: :string,
      profileId: {:union, [:string, :null]},
      resource: :string,
      status: {:enum, ["enabled", "blocked", "disabled", "deleted"]},
      url: :string,
      webhookSecret: :string
    ]
  end
end
