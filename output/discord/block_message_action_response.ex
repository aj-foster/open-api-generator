defmodule BlockMessageActionResponse do
  @moduledoc """
  Provides struct and type for a BlockMessageActionResponse
  """

  @type t :: %__MODULE__{metadata: BlockMessageActionMetadataResponse.t(), type: 1}

  defstruct [:metadata, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: {BlockMessageActionMetadataResponse, :t}, type: {:const, 1}]
  end
end
