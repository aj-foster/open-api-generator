defmodule FlagToChannelActionResponse do
  @moduledoc """
  Provides struct and type for a FlagToChannelActionResponse
  """

  @type t :: %__MODULE__{metadata: FlagToChannelActionMetadataResponse.t(), type: 2}

  defstruct [:metadata, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: {FlagToChannelActionMetadataResponse, :t}, type: {:const, 2}]
  end
end
