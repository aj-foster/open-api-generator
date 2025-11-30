defmodule Discord.UserGuildOnboardingResponse do
  @moduledoc """
  Provides struct and type for a UserGuildOnboardingResponse
  """

  @type t :: %__MODULE__{
          default_channel_ids: [String.t()],
          enabled: boolean,
          guild_id: String.t(),
          prompts: [Discord.OnboardingPromptResponse.t()]
        }

  defstruct [:default_channel_ids, :enabled, :guild_id, :prompts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default_channel_ids: [string: "snowflake"],
      enabled: :boolean,
      guild_id: {:string, "snowflake"},
      prompts: [{Discord.OnboardingPromptResponse, :t}]
    ]
  end
end
