defmodule Klaviyo.EventsBulkCreateQueryResourceObjectAttributesEvents do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQueryResourceObjectAttributesEvents
  """

  @type t :: %__MODULE__{data: [Klaviyo.BaseEventCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.BaseEventCreateQueryResourceObject, :t}]]
  end
end
