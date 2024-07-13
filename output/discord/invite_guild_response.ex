defmodule InviteGuildResponse do
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
      banner: {:union, [{:string, :generic}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      features: [string: :generic],
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      nsfw: {:union, [:boolean, :null]},
      nsfw_level: {:union, [:integer, :null]},
      premium_subscription_count: {:union, [:integer, :null]},
      splash: {:union, [{:string, :generic}, :null]},
      vanity_url_code: {:union, [{:string, :generic}, :null]},
      verification_level: {:union, [:integer, :null]}
    ]
  end
end
