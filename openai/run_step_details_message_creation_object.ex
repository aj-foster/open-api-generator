defmodule OpenAI.RunStepDetailsMessageCreationObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsMessageCreationObject
  """

  @type t :: %__MODULE__{
          message_creation: OpenAI.RunStepDetailsMessageCreationObjectMessageCreation.t(),
          type: String.t()
        }

  defstruct [:message_creation, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message_creation: {OpenAI.RunStepDetailsMessageCreationObjectMessageCreation, :t},
      type: {:const, "message_creation"}
    ]
  end
end
