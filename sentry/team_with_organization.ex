defmodule Sentry.TeamWithOrganization do
  @moduledoc """
  Provides struct and type for a TeamWithOrganization
  """

  @type t :: %__MODULE__{
          avatar: Sentry.Avatar.t(),
          dateCreated: DateTime.t(),
          hasAccess: boolean,
          id: String.t(),
          isMember: boolean,
          isPending: boolean,
          memberCount: integer,
          name: String.t(),
          organization: Sentry.Organization.t(),
          slug: String.t()
        }

  defstruct [
    :avatar,
    :dateCreated,
    :hasAccess,
    :id,
    :isMember,
    :isPending,
    :memberCount,
    :name,
    :organization,
    :slug
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {Sentry.Avatar, :t},
      dateCreated: {:string, "date-time"},
      hasAccess: :boolean,
      id: :string,
      isMember: :boolean,
      isPending: :boolean,
      memberCount: {:integer, "int64"},
      name: :string,
      organization: {Sentry.Organization, :t},
      slug: :string
    ]
  end
end
