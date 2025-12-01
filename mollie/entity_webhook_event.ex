defmodule Mollie.EntityWebhookEvent do
  @moduledoc """
  Provides struct and type for a EntityWebhookEvent
  """

  @type t :: %__MODULE__{
          _embedded: Mollie.EntityWebhookEventEmbedded.t() | nil,
          _links: Mollie.EntityWebhookEventLinks.t(),
          createdAt: String.t(),
          entityId: String.t(),
          id: String.t(),
          resource: String.t(),
          type: Mollie.EntityWebhookEventType.t()
        }

  defstruct [:_embedded, :_links, :createdAt, :entityId, :id, :resource, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _embedded: {:union, [{Mollie.EntityWebhookEventEmbedded, :t}, :null]},
      _links: {Mollie.EntityWebhookEventLinks, :t},
      createdAt: :string,
      entityId: :string,
      id: :string,
      resource: :string,
      type: {Mollie.EntityWebhookEventType, :t}
    ]
  end
end
