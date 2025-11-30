defmodule OpenAI.CreateCompletionResponse do
  @moduledoc """
  Provides struct and type for a CreateCompletionResponse
  """

  @type t :: %__MODULE__{
          choices: [OpenAI.CreateCompletionResponseChoices.t()],
          created: integer,
          id: String.t(),
          model: String.t(),
          object: String.t(),
          system_fingerprint: String.t() | nil,
          usage: OpenAI.CompletionUsage.t() | nil
        }

  defstruct [:choices, :created, :id, :model, :object, :system_fingerprint, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      choices: [{OpenAI.CreateCompletionResponseChoices, :t}],
      created: :integer,
      id: :string,
      model: :string,
      object: {:const, "text_completion"},
      system_fingerprint: :string,
      usage: {OpenAI.CompletionUsage, :t}
    ]
  end
end
