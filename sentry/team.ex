defmodule Sentry.Team do
  @moduledoc """
  Provides struct and type for a Team
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
      slug: :string
    ]
  end
end
