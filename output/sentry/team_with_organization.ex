defmodule TeamWithOrganization do
  @moduledoc """
  Provides struct and type for a TeamWithOrganization
  """

  @type t :: %__MODULE__{
          avatar: Avatar.t(),
          dateCreated: DateTime.t(),
          hasAccess: boolean,
          id: String.t(),
          isMember: boolean,
          isPending: boolean,
          memberCount: integer,
          name: String.t(),
          organization: Organization.t(),
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
      avatar: {Avatar, :t},
      dateCreated: {:string, :date_time},
      hasAccess: :boolean,
      id: {:string, :generic},
      isMember: :boolean,
      isPending: :boolean,
      memberCount: :integer,
      name: {:string, :generic},
      organization: {Organization, :t},
      slug: {:string, :generic}
    ]
  end
end
