defmodule OpenAI.ResponseTextDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseTextDeltaEvent
  """

  @type t :: %__MODULE__{
          content_index: integer,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:content_index, :delta, :item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_index: :integer,
      delta: {:string, :generic},
      item_id: {:string, :generic},
      output_index: :integer,
      type: {:const, "response.output_text.delta"}
    ]
  end
end
