defmodule OpenAI.RunStepDetailsMessageCreationObjectMessageCreation do
  @moduledoc """
  Provides struct and type for a RunStepDetailsMessageCreationObjectMessageCreation
  """

  @type t :: %__MODULE__{message_id: String.t()}

  defstruct [:message_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message_id: :string]
  end
end
