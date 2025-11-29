defmodule OnboardingPromptOptionResponse do
  @moduledoc """
  Provides struct and type for a OnboardingPromptOptionResponse
  """

  @type t :: %__MODULE__{
          channel_ids: [String.t()],
          description: String.t(),
          emoji: SettingsEmojiResponse.t(),
          id: String.t(),
          role_ids: [String.t()],
          title: String.t()
        }

  defstruct [:channel_ids, :description, :emoji, :id, :role_ids, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_ids: [string: :generic],
      description: {:string, :generic},
      emoji: {SettingsEmojiResponse, :t},
      id: {:string, :generic},
      role_ids: [string: :generic],
      title: {:string, :generic}
    ]
  end
end
