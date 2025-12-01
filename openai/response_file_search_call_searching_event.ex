defmodule OpenAI.ResponseFileSearchCallSearchingEvent do
  @moduledoc """
  Provides struct and type for a ResponseFileSearchCallSearchingEvent
  """

  @type t :: %__MODULE__{item_id: String.t(), output_index: integer, type: String.t()}

  defstruct [:item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item_id: :string,
      output_index: :integer,
      type: {:const, "response.file_search_call.searching"}
    ]
  end
end
