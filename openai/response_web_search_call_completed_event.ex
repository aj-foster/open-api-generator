defmodule ResponseWebSearchCallCompletedEvent do
  @moduledoc """
  Provides struct and type for a ResponseWebSearchCallCompletedEvent
  """

  @type t :: %__MODULE__{item_id: String.t(), output_index: integer, type: String.t()}

  defstruct [:item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item_id: {:string, :generic},
      output_index: :integer,
      type: {:const, "response.web_search_call.completed"}
    ]
  end
end
