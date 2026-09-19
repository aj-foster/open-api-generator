defmodule OpenAI.ResponseFunctionCallArgumentsDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseFunctionCallArgumentsDeltaEvent
  """

  @type t :: %__MODULE__{
          delta: String.t(),
          item_id: String.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:delta, :item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delta: :string,
      item_id: :string,
      output_index: :integer,
      type: {:const, "response.function_call_arguments.delta"}
    ]
  end
end
