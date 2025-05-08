defmodule PostProfileResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostProfileResponseDataAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          email: String.t() | nil,
          external_id: String.t() | nil,
          first_name: String.t() | nil,
          image: String.t() | nil,
          last_event_date: DateTime.t() | nil,
          last_name: String.t() | nil,
          location: ProfileLocation.t() | nil,
          organization: String.t() | nil,
          phone_number: String.t() | nil,
          predictive_analytics: PredictiveAnalytics.t() | nil,
          properties: map | nil,
          subscriptions: Subscriptions.t() | nil,
          title: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [
    :created,
    :email,
    :external_id,
    :first_name,
    :image,
    :last_event_date,
    :last_name,
    :location,
    :organization,
    :phone_number,
    :predictive_analytics,
    :properties,
    :subscriptions,
    :title,
    :updated
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, :date_time},
      email: {:string, :generic},
      external_id: {:string, :generic},
      first_name: {:string, :generic},
      image: {:string, :generic},
      last_event_date: {:string, :date_time},
      last_name: {:string, :generic},
      location: {ProfileLocation, :t},
      organization: {:string, :generic},
      phone_number: {:string, :generic},
      predictive_analytics: {PredictiveAnalytics, :t},
      properties: :map,
      subscriptions: {Subscriptions, :t},
      title: {:string, :generic},
      updated: {:string, :date_time}
    ]
  end
end
