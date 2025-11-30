defmodule Discord.ApplicationFormPartial do
  @moduledoc """
  Provides struct and type for a ApplicationFormPartial
  """

  @type t :: %__MODULE__{
          cover_image: String.t() | nil,
          custom_install_url: String.t() | nil,
          description: Discord.ApplicationFormPartialDescription.t() | nil,
          flags: integer | nil,
          icon: String.t() | nil,
          install_params: Discord.ApplicationOAuth2InstallParams.t() | nil,
          interactions_endpoint_url: String.t() | nil,
          max_participants: integer | nil,
          role_connections_verification_url: String.t() | nil,
          tags: [String.t()] | nil,
          team_id: String.t() | nil,
          type: integer | nil
        }

  defstruct [
    :cover_image,
    :custom_install_url,
    :description,
    :flags,
    :icon,
    :install_params,
    :interactions_endpoint_url,
    :max_participants,
    :role_connections_verification_url,
    :tags,
    :team_id,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cover_image: {:union, [:string, :null]},
      custom_install_url: {:union, [{:string, "uri"}, :null]},
      description: {:union, [{Discord.ApplicationFormPartialDescription, :t}, :null]},
      flags: {:union, [:integer, :null]},
      icon: {:union, [:string, :null]},
      install_params: {:union, [{Discord.ApplicationOAuth2InstallParams, :t}, :null]},
      interactions_endpoint_url: {:union, [{:string, "uri"}, :null]},
      max_participants: {:union, [{:integer, "int32"}, :null]},
      role_connections_verification_url: {:union, [{:string, "uri"}, :null]},
      tags: {:union, [[:string], :null]},
      team_id: {:union, [{:string, "snowflake"}, :null]},
      type: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
