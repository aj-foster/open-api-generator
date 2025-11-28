defmodule PrivateGroupChannelResponse do
  @moduledoc """
  Provides struct and type for a PrivateGroupChannelResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t() | nil,
          flags: integer,
          icon: String.t() | nil,
          id: String.t(),
          last_message_id: String.t() | nil,
          last_pin_timestamp: DateTime.t() | nil,
          managed: boolean | nil,
          name: String.t() | nil,
          owner_id: String.t() | nil,
          recipients: [UserResponse.t()],
          type: 3
        }

  defstruct [
    :application_id,
    :flags,
    :icon,
    :id,
    :last_message_id,
    :last_pin_timestamp,
    :managed,
    :name,
    :owner_id,
    :recipients,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:union, [{:string, :generic}, :null]},
      flags: :integer,
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      last_message_id: {:union, [{:string, :generic}, :null]},
      last_pin_timestamp: {:union, [{:string, :date_time}, :null]},
      managed: {:union, [:boolean, :null]},
      name: {:union, [{:string, :generic}, :null]},
      owner_id: {:union, [{:string, :generic}, :null]},
      recipients: [{UserResponse, :t}],
      type: {:const, 3}
    ]
  end
end
