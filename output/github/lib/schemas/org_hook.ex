defmodule GitHub.OrgHook do
  @moduledoc """
  Provides struct and type for a OrgHook
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          active: boolean,
          config: GitHub.OrgHookConfig.t(),
          created_at: DateTime.t(),
          deliveries_url: String.t() | nil,
          events: [String.t()],
          id: integer,
          name: String.t(),
          ping_url: String.t(),
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
    :name,
    :ping_url,
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
      config: {GitHub.OrgHookConfig, :t},
      created_at: {:string, :date_time},
      deliveries_url: {:string, :uri},
      events: [string: :generic],
      id: :integer,
      name: {:string, :generic},
      ping_url: {:string, :uri},
      type: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
