defmodule PrivateChannelResponse do
  @moduledoc """
  Provides struct and type for a PrivateChannelResponse
  """

  @type t :: %__MODULE__{
          flags: integer,
          id: String.t(),
          last_message_id: String.t() | nil,
          last_pin_timestamp: DateTime.t() | nil,
          recipients: [UserResponse.t()],
          type: 1
        }

  defstruct [:flags, :id, :last_message_id, :last_pin_timestamp, :recipients, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flags: :integer,
      id: {:string, :generic},
      last_message_id: {:union, [{:string, :generic}, :null]},
      last_pin_timestamp: {:union, [{:string, :date_time}, :null]},
      recipients: [{UserResponse, :t}],
      type: {:const, 1}
    ]
  end
end
