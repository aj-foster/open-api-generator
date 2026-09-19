defmodule Discord.InviteGuildResponse do
  @moduledoc """
  Provides struct and type for a InviteGuildResponse
  """

  @type t :: %__MODULE__{
          banner: String.t() | nil,
          description: String.t() | nil,
          features: [String.t()],
          icon: String.t() | nil,
          id: String.t(),
          name: String.t(),
          nsfw: boolean | nil,
          nsfw_level: integer | nil,
          premium_subscription_count: integer | nil,
          splash: String.t() | nil,
          vanity_url_code: String.t() | nil,
          verification_level: integer | nil
        }

  defstruct [
    :banner,
    :description,
    :features,
    :icon,
    :id,
    :name,
    :nsfw,
    :nsfw_level,
    :premium_subscription_count,
    :splash,
    :vanity_url_code,
    :verification_level
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      banner: {:union, [:string, :null]},
      description: {:union, [:string, :null]},
      features: [:string],
      icon: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      name: :string,
      nsfw: {:union, [:boolean, :null]},
      nsfw_level: {:union, [{:integer, "int32"}, :null]},
      premium_subscription_count: {:union, [{:integer, "int32"}, :null]},
      splash: {:union, [:string, :null]},
      vanity_url_code: {:union, [:string, :null]},
      verification_level: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
