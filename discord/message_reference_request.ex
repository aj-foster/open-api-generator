defmodule Discord.MessageReferenceRequest do
  @moduledoc """
  Provides struct and type for a MessageReferenceRequest
  """

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          fail_if_not_exists: boolean | nil,
          guild_id: String.t() | nil,
          message_id: String.t(),
          type: integer | nil
        }

  defstruct [:channel_id, :fail_if_not_exists, :guild_id, :message_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:union, [{:string, "snowflake"}, :null]},
      fail_if_not_exists: {:union, [:boolean, :null]},
      guild_id: {:union, [{:string, "snowflake"}, :null]},
      message_id: {:string, "snowflake"},
      type: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
