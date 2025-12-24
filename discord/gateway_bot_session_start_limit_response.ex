defmodule Discord.GatewayBotSessionStartLimitResponse do
  @moduledoc """
  Provides struct and type for a GatewayBotSessionStartLimitResponse
  """

  @type t :: %__MODULE__{
          max_concurrency: integer,
          remaining: integer,
          reset_after: integer,
          total: integer
        }

  defstruct [:max_concurrency, :remaining, :reset_after, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      max_concurrency: {:integer, "int32"},
      remaining: {:integer, "int32"},
      reset_after: {:integer, "int32"},
      total: {:integer, "int32"}
    ]
  end
end
