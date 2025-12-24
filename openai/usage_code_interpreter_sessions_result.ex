defmodule OpenAI.UsageCodeInterpreterSessionsResult do
  @moduledoc """
  Provides struct and type for a UsageCodeInterpreterSessionsResult
  """

  @type t :: %__MODULE__{
          num_sessions: integer | nil,
          object: String.t(),
          project_id: String.t() | nil
        }

  defstruct [:num_sessions, :object, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      num_sessions: :integer,
      object: {:const, "organization.usage.code_interpreter_sessions.result"},
      project_id: :string
    ]
  end
end
