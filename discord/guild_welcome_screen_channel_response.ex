defmodule GuildWelcomeScreenChannelResponse do
  @moduledoc """
  Provides struct and type for a GuildWelcomeScreenChannelResponse
  """

  @type t :: %__MODULE__{
          channel_id: String.t(),
          description: String.t(),
          emoji_id: String.t() | nil,
          emoji_name: String.t() | nil
        }

  defstruct [:channel_id, :description, :emoji_id, :emoji_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:string, :generic},
      description: {:string, :generic},
      emoji_id: {:union, [{:string, :generic}, :null]},
      emoji_name: {:union, [{:string, :generic}, :null]}
    ]
  end
end
