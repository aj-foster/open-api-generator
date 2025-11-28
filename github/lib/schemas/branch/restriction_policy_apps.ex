defmodule GitHub.Branch.RestrictionPolicyApps do
  @moduledoc """
  Provides struct and type for a Branch.RestrictionPolicyApps
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: String.t() | nil,
          description: String.t() | nil,
          events: [String.t()] | nil,
          external_url: String.t() | nil,
          html_url: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          owner: GitHub.Branch.RestrictionPolicyAppsOwner.t() | nil,
          permissions: GitHub.Branch.RestrictionPolicyAppsPermissions.t() | nil,
          slug: String.t() | nil,
          updated_at: String.t() | nil
        }

  defstruct [
    :__info__,
    :created_at,
    :description,
    :events,
    :external_url,
    :html_url,
    :id,
    :name,
    :node_id,
    :owner,
    :permissions,
    :slug,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :generic},
      description: {:string, :generic},
      events: [string: :generic],
      external_url: {:string, :generic},
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      owner: {GitHub.Branch.RestrictionPolicyAppsOwner, :t},
      permissions: {GitHub.Branch.RestrictionPolicyAppsPermissions, :t},
      slug: {:string, :generic},
      updated_at: {:string, :generic}
    ]
  end
end
