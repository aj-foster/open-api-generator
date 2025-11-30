defmodule Discord.GroupDMInviteResponse do
  @moduledoc """
  Provides struct and type for a GroupDMInviteResponse
  """

  @type t :: %__MODULE__{
          approximate_member_count: integer | nil,
          channel: Discord.InviteChannelResponse.t() | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil,
          inviter: Discord.UserResponse.t() | nil,
          max_age: integer | nil,
          type: 1 | nil
        }

  defstruct [
    :approximate_member_count,
    :channel,
    :code,
    :created_at,
    :expires_at,
    :inviter,
    :max_age,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approximate_member_count: {:union, [{:integer, "int32"}, :null]},
      channel: {:union, [{Discord.InviteChannelResponse, :t}, :null]},
      code: :string,
      created_at: {:union, [{:string, "date-time"}, :null]},
      expires_at: {:union, [{:string, "date-time"}, :null]},
      inviter: {:union, [{Discord.UserResponse, :t}, :null]},
      max_age: {:union, [{:integer, "int32"}, :null]},
      type: {:union, [{:const, 1}, :null]}
    ]
  end
end
