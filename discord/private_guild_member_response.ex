defmodule PrivateGuildMemberResponse do
  @moduledoc """
  Provides struct and type for a PrivateGuildMemberResponse
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          avatar_decoration_data: map | nil,
          banner: String.t() | nil,
          communication_disabled_until: DateTime.t() | nil,
          deaf: boolean,
          flags: integer,
          joined_at: DateTime.t(),
          mute: boolean,
          nick: String.t() | nil,
          pending: boolean,
          premium_since: DateTime.t() | nil,
          roles: [String.t()],
          user: UserResponse.t()
        }

  defstruct [
    :avatar,
    :avatar_decoration_data,
    :banner,
    :communication_disabled_until,
    :deaf,
    :flags,
    :joined_at,
    :mute,
    :nick,
    :pending,
    :premium_since,
    :roles,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:union, [{:string, :generic}, :null]},
      avatar_decoration_data: {:union, [:map, :null]},
      banner: {:union, [{:string, :generic}, :null]},
      communication_disabled_until: {:union, [{:string, :date_time}, :null]},
      deaf: :boolean,
      flags: :integer,
      joined_at: {:string, :date_time},
      mute: :boolean,
      nick: {:union, [{:string, :generic}, :null]},
      pending: :boolean,
      premium_since: {:union, [{:string, :date_time}, :null]},
      roles: [string: :generic],
      user: {UserResponse, :t}
    ]
  end
end
