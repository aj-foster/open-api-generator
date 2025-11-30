defmodule OpenAI.ResponseRefusalDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseRefusalDeltaEvent
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
      delta: :string,
      item_id: :string,
      output_index: :integer,
      type: {:const, "response.refusal.delta"}
    ]
  end
end
