defmodule Discord.MessageReferenceResponse do
  @moduledoc """
  Provides struct and type for a MessageReferenceResponse
  """

  @type t :: %__MODULE__{
          channel_id: String.t(),
          guild_id: String.t() | nil,
          message_id: String.t() | nil,
          type: integer | nil
        }

  defstruct [:channel_id, :guild_id, :message_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:string, "snowflake"},
      guild_id: {:union, [{:string, "snowflake"}, :null]},
      message_id: {:union, [{:string, "snowflake"}, :null]},
      type: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
