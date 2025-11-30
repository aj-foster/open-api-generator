defmodule Discord.FriendInviteResponse do
  @moduledoc """
  Provides struct and type for a FriendInviteResponse
  """

  @type t :: %__MODULE__{
          channel: Discord.InviteChannelResponse.t() | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil,
          flags: integer | nil,
          friends_count: integer | nil,
          inviter: Discord.UserResponse.t() | nil,
          is_contact: boolean | nil,
          max_age: integer | nil,
          max_uses: integer | nil,
          type: 2 | nil,
          uses: integer | nil
        }

  defstruct [
    :channel,
    :code,
    :created_at,
    :expires_at,
    :flags,
    :friends_count,
    :inviter,
    :is_contact,
    :max_age,
    :max_uses,
    :type,
    :uses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel: {:union, [{Discord.InviteChannelResponse, :t}, :null]},
      code: :string,
      created_at: {:union, [{:string, "date-time"}, :null]},
      expires_at: {:union, [{:string, "date-time"}, :null]},
      flags: {:union, [{:integer, "int32"}, :null]},
      friends_count: {:union, [{:integer, "int32"}, :null]},
      inviter: {:union, [{Discord.UserResponse, :t}, :null]},
      is_contact: {:union, [:boolean, :null]},
      max_age: {:union, [{:integer, "int32"}, :null]},
      max_uses: {:union, [{:integer, "int32"}, :null]},
      type: {:union, [{:const, 2}, :null]},
      uses: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
