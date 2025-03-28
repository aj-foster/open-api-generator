defmodule EventsBulkCreateQueryResourceObjectAttributesProfile do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQueryResourceObjectAttributesProfile
  """

  @type t :: %__MODULE__{data: OnsiteProfileCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OnsiteProfileCreateQueryResourceObject, :t}]
  end
end
