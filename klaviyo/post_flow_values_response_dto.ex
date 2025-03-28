defmodule PostFlowValuesResponseDTO do
  @moduledoc """
  Provides struct and type for a PostFlowValuesResponseDTO
  """

  @type t :: %__MODULE__{data: PostFlowValuesResponseDTOData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostFlowValuesResponseDTOData, :t}]
  end
end
