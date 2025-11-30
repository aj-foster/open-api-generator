defmodule Sentry.Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """

  @type t :: %__MODULE__{
          avatar: Sentry.Avatar.t(),
          dateCreated: DateTime.t(),
          id: String.t(),
          isEarlyAdopter: boolean,
          name: String.t(),
          require2FA: boolean,
          slug: String.t(),
          status: Sentry.OrganizationStatus.t()
        }

  defstruct [:avatar, :dateCreated, :id, :isEarlyAdopter, :name, :require2FA, :slug, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {Sentry.Avatar, :t},
      dateCreated: {:string, "date-time"},
      id: :string,
      isEarlyAdopter: :boolean,
      name: :string,
      require2FA: :boolean,
      slug: :string,
      status: {Sentry.OrganizationStatus, :t}
    ]
  end
end
