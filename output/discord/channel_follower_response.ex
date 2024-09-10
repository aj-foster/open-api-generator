defmodule ChannelFollowerResponse do
  @moduledoc """
  Provides struct and type for a ChannelFollowerResponse
  """

  @type t :: %__MODULE__{channel_id: String.t(), webhook_id: String.t()}

  defstruct [:channel_id, :webhook_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [channel_id: {:string, :generic}, webhook_id: {:string, :generic}]
  end
end
