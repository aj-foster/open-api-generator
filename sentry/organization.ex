defmodule Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """

  @type t :: %__MODULE__{
          avatar: Avatar.t(),
          dateCreated: DateTime.t(),
          id: String.t(),
          isEarlyAdopter: boolean,
          name: String.t(),
          require2FA: boolean,
          slug: String.t(),
          status: OrganizationStatus.t()
        }

  defstruct [:avatar, :dateCreated, :id, :isEarlyAdopter, :name, :require2FA, :slug, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {Avatar, :t},
      dateCreated: {:string, :date_time},
      id: {:string, :generic},
      isEarlyAdopter: :boolean,
      name: {:string, :generic},
      require2FA: :boolean,
      slug: {:string, :generic},
      status: {OrganizationStatus, :t}
    ]
  end
end
