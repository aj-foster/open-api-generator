defmodule ReasoningItem do
  @moduledoc """
  Provides struct and type for a ReasoningItem
  """

  @type t :: %__MODULE__{
          content: [ReasoningItemContent.t()],
          id: String.t(),
          status: String.t() | nil,
          type: String.t()
        }

  defstruct [:content, :id, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [{ReasoningItemContent, :t}],
      id: {:string, :generic},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "reasoning"}
    ]
  end
end
