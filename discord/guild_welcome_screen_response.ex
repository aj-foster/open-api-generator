defmodule GuildWelcomeScreenResponse do
  @moduledoc """
  Provides struct and type for a GuildWelcomeScreenResponse
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          welcome_channels: [GuildWelcomeScreenChannelResponse.t()]
        }

  defstruct [:description, :welcome_channels]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      welcome_channels: [{GuildWelcomeScreenChannelResponse, :t}]
    ]
  end
end
