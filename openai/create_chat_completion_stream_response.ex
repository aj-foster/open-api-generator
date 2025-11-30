defmodule OpenAI.CreateChatCompletionStreamResponse do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionStreamResponse
  """

  @type t :: %__MODULE__{
          choices: [OpenAI.CreateChatCompletionStreamResponseChoices.t()],
          created: integer,
          id: String.t(),
          model: String.t(),
          object: String.t(),
          service_tier: String.t() | nil,
          system_fingerprint: String.t() | nil,
          usage: OpenAI.CreateChatCompletionStreamResponseUsage.t() | nil
        }

  defstruct [:choices, :created, :id, :model, :object, :service_tier, :system_fingerprint, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      choices: [{OpenAI.CreateChatCompletionStreamResponseChoices, :t}],
      created: :integer,
      id: :string,
      model: :string,
      object: {:const, "chat.completion.chunk"},
      service_tier: {:enum, ["scale", "default"]},
      system_fingerprint: :string,
      usage: {OpenAI.CreateChatCompletionStreamResponseUsage, :t}
    ]
  end
end
