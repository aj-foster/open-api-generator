defmodule EventsBulkCreateQuery do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQuery
  """

  @type t :: %__MODULE__{data: EventsBulkCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {EventsBulkCreateQueryResourceObject, :t}]
  end
end
