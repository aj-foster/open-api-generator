defmodule Discord.UpdateGuildOnboardingRequest do
  @moduledoc """
  Provides struct and type for a UpdateGuildOnboardingRequest
  """

  @type t :: %__MODULE__{
          default_channel_ids: [String.t()] | nil,
          enabled: boolean | nil,
          mode: integer | nil,
          prompts: [map] | nil
        }

  defstruct [:default_channel_ids, :enabled, :mode, :prompts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default_channel_ids: {:union, [[string: "snowflake"], :null]},
      enabled: {:union, [:boolean, :null]},
      mode: {:union, [{:integer, "int32"}, :null]},
      prompts: {:union, [[:map], :null]}
    ]
  end
end
