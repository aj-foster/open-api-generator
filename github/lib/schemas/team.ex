defmodule GitHub.Team do
  @moduledoc """
  Provides struct and types for a Team
  """
  use GitHub.Encoder

  @type full :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          ldap_dn: String.t() | nil,
          members_count: integer,
          members_url: String.t(),
          name: String.t(),
          node_id: String.t(),
          notification_setting: String.t() | nil,
          organization: GitHub.Team.Organization.t(),
          parent: GitHub.Team.simple() | nil,
          permission: String.t(),
          privacy: String.t() | nil,
          repos_count: integer,
          repositories_url: String.t(),
          slug: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  @type simple :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          ldap_dn: String.t() | nil,
          members_url: String.t(),
          name: String.t(),
          node_id: String.t(),
          notification_setting: String.t() | nil,
          permission: String.t(),
          privacy: String.t() | nil,
          repositories_url: String.t(),
          slug: String.t(),
          url: String.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          members_url: String.t(),
          name: String.t(),
          node_id: String.t(),
          notification_setting: String.t() | nil,
          parent: GitHub.Team.simple() | nil,
          permission: String.t(),
          permissions: GitHub.Team.Permissions.t() | nil,
          privacy: String.t() | nil,
          repositories_url: String.t(),
          slug: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :description,
    :html_url,
    :id,
    :ldap_dn,
    :members_count,
    :members_url,
    :name,
    :node_id,
    :notification_setting,
    :organization,
    :parent,
    :permission,
    :permissions,
    :privacy,
    :repos_count,
    :repositories_url,
    :slug,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:full) do
    [
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      ldap_dn: {:string, :generic},
      members_count: :integer,
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:enum, ["notifications_enabled", "notifications_disabled"]},
      organization: {GitHub.Team.Organization, :t},
      parent: {:union, [{GitHub.Team, :simple}, :null]},
      permission: {:string, :generic},
      privacy: {:enum, ["closed", "secret"]},
      repos_count: :integer,
      repositories_url: {:string, :uri},
      slug: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end

  def __fields__(:simple) do
    [
      description: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      ldap_dn: {:string, :generic},
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:string, :generic},
      permission: {:string, :generic},
      privacy: {:string, :generic},
      repositories_url: {:string, :uri},
      slug: {:string, :generic},
      url: {:string, :uri}
    ]
  end

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:string, :generic},
      parent: {:union, [{GitHub.Team, :simple}, :null]},
      permission: {:string, :generic},
      permissions: {GitHub.Team.Permissions, :t},
      privacy: {:string, :generic},
      repositories_url: {:string, :uri},
      slug: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
