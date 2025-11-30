defmodule GitHub.Hook.Delivery do
  @moduledoc """
  Provides struct and type for a Hook.Delivery
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          action: String.t() | nil,
          delivered_at: DateTime.t(),
          duration: number,
          event: String.t(),
          guid: String.t(),
          id: integer,
          installation_id: integer | nil,
          redelivery: boolean,
          repository_id: integer | nil,
          request: GitHub.Hook.DeliveryRequest.t(),
          response: GitHub.Hook.DeliveryResponse.t(),
          status: String.t(),
          status_code: integer,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :action,
    :delivered_at,
    :duration,
    :event,
    :guid,
    :id,
    :installation_id,
    :redelivery,
    :repository_id,
    :request,
    :response,
    :status,
    :status_code,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:union, [:string, :null]},
      delivered_at: {:string, "date-time"},
      duration: :number,
      event: :string,
      guid: :string,
      id: :integer,
      installation_id: {:union, [:integer, :null]},
      redelivery: :boolean,
      repository_id: {:union, [:integer, :null]},
      request: {GitHub.Hook.DeliveryRequest, :t},
      response: {GitHub.Hook.DeliveryResponse, :t},
      status: :string,
      status_code: :integer,
      url: :string
    ]
  end
end
