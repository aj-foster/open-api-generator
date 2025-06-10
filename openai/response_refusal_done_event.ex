defmodule ResponseRefusalDoneEvent do
  @moduledoc """
  Provides struct and type for a ResponseRefusalDoneEvent
  """

  @type t :: %__MODULE__{
          content_index: integer,
          item_id: String.t(),
          output_index: integer,
          refusal: String.t(),
          type: String.t()
        }

  defstruct [:content_index, :item_id, :output_index, :refusal, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_index: :integer,
      item_id: {:string, :generic},
      output_index: :integer,
      refusal: {:string, :generic},
      type: {:const, "response.refusal.done"}
    ]
  end
end
