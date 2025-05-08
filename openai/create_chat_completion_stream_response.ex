defmodule CreateChatCompletionStreamResponse do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionStreamResponse
  """

  @type t :: %__MODULE__{
          choices: [CreateChatCompletionStreamResponseChoices.t()],
          created: integer,
          id: String.t(),
          model: String.t(),
          object: String.t(),
          service_tier: String.t() | nil,
          system_fingerprint: String.t() | nil,
          usage: CreateChatCompletionStreamResponseUsage.t() | nil
        }

  defstruct [:choices, :created, :id, :model, :object, :service_tier, :system_fingerprint, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      choices: [{CreateChatCompletionStreamResponseChoices, :t}],
      created: :integer,
      id: {:string, :generic},
      model: {:string, :generic},
      object: {:const, "chat.completion.chunk"},
      service_tier: {:enum, ["scale", "default"]},
      system_fingerprint: {:string, :generic},
      usage: {CreateChatCompletionStreamResponseUsage, :t}
    ]
  end
end
