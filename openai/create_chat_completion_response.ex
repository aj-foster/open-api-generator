defmodule OpenAI.CreateChatCompletionResponse do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionResponse
  """

  @type t :: %__MODULE__{
          choices: [OpenAI.CreateChatCompletionResponseChoices.t()],
          created: integer,
          id: String.t(),
          model: String.t(),
          object: String.t(),
          service_tier: String.t() | nil,
          system_fingerprint: String.t() | nil,
          usage: OpenAI.CompletionUsage.t() | nil
        }

  defstruct [:choices, :created, :id, :model, :object, :service_tier, :system_fingerprint, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      choices: [{OpenAI.CreateChatCompletionResponseChoices, :t}],
      created: :integer,
      id: :string,
      model: :string,
      object: {:const, "chat.completion"},
      service_tier: {:enum, ["scale", "default"]},
      system_fingerprint: :string,
      usage: {OpenAI.CompletionUsage, :t}
    ]
  end
end
