defmodule InviteApplicationResponse do
  @moduledoc """
  Provides struct and type for a InviteApplicationResponse
  """

  @type t :: %__MODULE__{
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
          max_participants: integer | nil,
          name: String.t(),
          primary_sku_id: String.t() | nil,
          privacy_policy_url: String.t() | nil,
          rpc_origins: [String.t() | nil] | nil,
          slug: String.t() | nil,
          tags: [String.t()] | nil,
          terms_of_service_url: String.t() | nil,
          type: integer | nil,
          verify_key: String.t()
        }

  defstruct [
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
    :max_participants,
    :name,
    :primary_sku_id,
    :privacy_policy_url,
    :rpc_origins,
    :slug,
    :tags,
    :terms_of_service_url,
    :type,
    :verify_key
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bot: {:union, [{UserResponse, :t}, :null]},
      bot_public: {:union, [:boolean, :null]},
      bot_require_code_grant: {:union, [:boolean, :null]},
      cover_image: {:union, [{:string, :generic}, :null]},
      custom_install_url: {:union, [{:string, :uri}, :null]},
      description: {:string, :generic},
      flags: :integer,
      guild_id: {:union, [{:string, :generic}, :null]},
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      install_params: {:union, [{ApplicationOAuth2InstallParamsResponse, :t}, :null]},
      max_participants: {:union, [:integer, :null]},
      name: {:string, :generic},
      primary_sku_id: {:union, [{:string, :generic}, :null]},
      privacy_policy_url: {:union, [{:string, :uri}, :null]},
      rpc_origins: {:union, [[union: [{:string, :generic}, :null]], :null]},
      slug: {:union, [{:string, :generic}, :null]},
      tags: {:union, [[string: :generic], :null]},
      terms_of_service_url: {:union, [{:string, :uri}, :null]},
      type: {:union, [:integer, :null]},
      verify_key: {:string, :generic}
    ]
  end
end
