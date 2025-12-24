defmodule OpenAI.Reasoning do
  @moduledoc """
  Provides struct and type for a Reasoning
  """

  @type t :: %__MODULE__{effort: String.t() | nil, generate_summary: String.t() | nil}

  defstruct [:effort, :generate_summary]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      effort: {:enum, ["low", "medium", "high"]},
      generate_summary: {:enum, ["concise", "detailed"]}
    ]
  end
end
