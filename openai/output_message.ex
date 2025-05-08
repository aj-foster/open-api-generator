defmodule OutputMessage do
  @moduledoc """
  Provides struct and type for a OutputMessage
  """

  @type t :: %__MODULE__{
          content: [OutputText.t() | Refusal.t()],
          id: String.t(),
          role: String.t(),
          status: String.t(),
          type: String.t()
        }

  defstruct [:content, :id, :role, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [union: [{OutputText, :t}, {Refusal, :t}]],
      id: {:string, :generic},
      role: {:const, "assistant"},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "message"}
    ]
  end
end
