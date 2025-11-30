defmodule OpenAI.ResponseTextDoneEvent do
  @moduledoc """
  Provides struct and type for a ResponseTextDoneEvent
  """

  @type t :: %__MODULE__{
          content_index: integer,
          item_id: String.t(),
          output_index: integer,
          text: String.t(),
          type: String.t()
        }

  defstruct [:content_index, :item_id, :output_index, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_index: :integer,
      item_id: :string,
      output_index: :integer,
      text: :string,
      type: {:const, "response.output_text.done"}
    ]
  end
end
