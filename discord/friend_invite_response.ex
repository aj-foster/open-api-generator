defmodule FriendInviteResponse do
  @moduledoc """
  Provides struct and type for a FriendInviteResponse
  """

  @type t :: %__MODULE__{
          channel: InviteChannelResponse.t() | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil,
          flags: integer | nil,
          friends_count: integer | nil,
          inviter: UserResponse.t() | nil,
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
      channel: {:union, [{InviteChannelResponse, :t}, :null]},
      code: {:string, :generic},
      created_at: {:union, [{:string, :date_time}, :null]},
      expires_at: {:union, [{:string, :date_time}, :null]},
      flags: {:union, [:integer, :null]},
      friends_count: {:union, [:integer, :null]},
      inviter: {:union, [{UserResponse, :t}, :null]},
      is_contact: {:union, [:boolean, :null]},
      max_age: {:union, [:integer, :null]},
      max_uses: {:union, [:integer, :null]},
      type: {:union, [{:const, 2}, :null]},
      uses: {:union, [:integer, :null]}
    ]
  end
end
