defmodule GatewayBotResponse do
  @moduledoc """
  Provides struct and type for a GatewayBotResponse
  """

  @type t :: %__MODULE__{
          session_start_limit: GatewayBotSessionStartLimitResponse.t(),
          shards: integer,
          url: String.t()
        }

  defstruct [:session_start_limit, :shards, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      session_start_limit: {GatewayBotSessionStartLimitResponse, :t},
      shards: :integer,
      url: {:string, :uri}
    ]
  end
end
