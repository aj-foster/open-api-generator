defmodule PostFlowValuesResponseDTODataAttributes do
  @moduledoc """
  Provides struct and type for a PostFlowValuesResponseDTODataAttributes
  """

  @type t :: %__MODULE__{results: [ValuesData.t()]}

  defstruct [:results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [results: [{ValuesData, :t}]]
  end
end
