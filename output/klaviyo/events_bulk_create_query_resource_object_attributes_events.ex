defmodule EventsBulkCreateQueryResourceObjectAttributesEvents do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQueryResourceObjectAttributesEvents
  """

  @type t :: %__MODULE__{data: [BaseEventCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{BaseEventCreateQueryResourceObject, :t}]]
  end
end
