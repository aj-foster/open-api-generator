defmodule OpenAI.WebSearchToolCall do
  @moduledoc """
  Provides struct and type for a WebSearchToolCall
  """

  @type t :: %__MODULE__{id: String.t(), status: String.t(), type: String.t()}

  defstruct [:id, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      status: {:enum, ["in_progress", "searching", "completed", "failed"]},
      type: {:const, "web_search_call"}
    ]
  end
end
