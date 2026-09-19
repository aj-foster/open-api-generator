defmodule Sentry.Message do
  @moduledoc """
  Provides struct and type for a Message
  """

  @type t :: %__MODULE__{data: Sentry.MessageData.t(), type: String.t()}

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Sentry.MessageData, :t}, type: :string]
  end
end
