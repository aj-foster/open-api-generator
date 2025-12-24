defmodule OpenAI.ResponseContentPartDoneEvent do
  @moduledoc """
  Provides struct and type for a ResponseContentPartDoneEvent
  """

  @type t :: %__MODULE__{
          content_index: integer,
          item_id: String.t(),
          output_index: integer,
          part: OpenAI.OutputText.t() | OpenAI.Refusal.t(),
          type: String.t()
        }

  defstruct [:content_index, :item_id, :output_index, :part, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_index: :integer,
      item_id: :string,
      output_index: :integer,
      part: {:union, [{OpenAI.OutputText, :t}, {OpenAI.Refusal, :t}]},
      type: {:const, "response.content_part.done"}
    ]
  end
end
