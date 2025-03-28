defmodule PrivateApplicationResponse do
  @moduledoc """
  Provides struct and type for a PrivateApplicationResponse
  """

  @type t :: %__MODULE__{
          approximate_guild_count: integer | nil,
          bot: UserResponse.t() | nil,
          bot_public: boolean | nil,
          bot_require_code_grant: boolean | nil,
          cover_image: String.t() | nil,
          custom_install_url: String.t() | nil,
          description: String.t(),
          flags: integer,
          guild_id: String.t() | nil,
          icon: String.t() | nil,
          id: String.t(),
          install_params: ApplicationOAuth2InstallParamsResponse.t() | nil,
          interactions_endpoint_url: String.t() | nil,
          max_participants: integer | nil,
          name: String.t(),
          owner: UserResponse.t(),
          primary_sku_id: String.t() | nil,
          privacy_policy_url: String.t() | nil,
          redirect_uris: [String.t() | nil],
          role_connections_verification_url: String.t() | nil,
          rpc_origins: [String.t() | nil] | nil,
          slug: String.t() | nil,
          tags: [String.t()] | nil,
          team: TeamResponse.t() | nil,
          terms_of_service_url: String.t() | nil,
          type: integer | nil,
          verify_key: String.t()
        }

  defstruct [
    :approximate_guild_count,
    :bot,
    :bot_public,
    :bot_require_code_grant,
    :cover_image,
    :custom_install_url,
    :description,
    :flags,
    :guild_id,
    :icon,
    :id,
    :install_params,
    :interactions_endpoint_url,
    :max_participants,
    :name,
    :owner,
    :primary_sku_id,
    :privacy_policy_url,
    :redirect_uris,
    :role_connections_verification_url,
    :rpc_origins,
    :slug,
    :tags,
    :team,
    :terms_of_service_url,
    :type,
    :verify_key
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approximate_guild_count: {:union, [{:integer, :int32}, :null]},
      bot: {:union, [{UserResponse, :t}, :null]},
      bot_public: {:union, [:boolean, :null]},
      bot_require_code_grant: {:union, [:boolean, :null]},
      cover_image: {:union, [{:string, :generic}, :null]},
      custom_install_url: {:union, [{:string, :uri}, :null]},
      description: {:string, :generic},
      flags: {:integer, :int32},
      guild_id: {:union, [{:string, "snowflake"}, :null]},
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, "snowflake"},
      install_params: {:union, [{ApplicationOAuth2InstallParamsResponse, :t}, :null]},
      interactions_endpoint_url: {:union, [{:string, :uri}, :null]},
      max_participants: {:union, [{:integer, :int32}, :null]},
      name: {:string, :generic},
      owner: {UserResponse, :t},
      primary_sku_id: {:union, [{:string, "snowflake"}, :null]},
      privacy_policy_url: {:union, [{:string, :uri}, :null]},
      redirect_uris: [union: [{:string, :uri}, :null]],
      role_connections_verification_url: {:union, [{:string, :uri}, :null]},
      rpc_origins: {:union, [[union: [{:string, :generic}, :null]], :null]},
      slug: {:union, [{:string, :generic}, :null]},
      tags: {:union, [[string: :generic], :null]},
      team: {:union, [{TeamResponse, :t}, :null]},
      terms_of_service_url: {:union, [{:string, :uri}, :null]},
      type: {:union, [{:integer, :int32}, :null]},
      verify_key: {:string, :generic}
    ]
  end
end
