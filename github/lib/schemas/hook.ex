defmodule GitHub.Hook do
  @moduledoc """
  Provides struct and type for a Hook
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          active: boolean,
          config: GitHub.Webhook.Config.t(),
          created_at: DateTime.t(),
          deliveries_url: String.t() | nil,
          events: [String.t()],
          id: integer,
          last_response: GitHub.Hook.Response.t(),
          name: String.t(),
          ping_url: String.t(),
          test_url: String.t(),
          type: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :active,
    :config,
    :created_at,
    :deliveries_url,
    :events,
    :id,
    :last_response,
    :name,
    :ping_url,
    :test_url,
    :type,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active: :boolean,
      config: {GitHub.Webhook.Config, :t},
      created_at: {:string, :date_time},
      deliveries_url: {:string, :uri},
      events: [string: :generic],
      id: :integer,
      last_response: {GitHub.Hook.Response, :t},
      name: {:string, :generic},
      ping_url: {:string, :uri},
      test_url: {:string, :uri},
      type: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
