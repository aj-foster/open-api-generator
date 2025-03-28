defmodule Invitation do
  @moduledoc """
  Provides struct and type for a Invitation
  """

  @type t :: %__MODULE__{
          createdDt: DateTime.t() | nil,
          email: String.t() | nil,
          expiryDate: Date.t() | nil,
          identifier: String.t() | nil,
          invitedBy: User.t() | nil,
          organization: Organization.t() | nil,
          respondedBy: InvitationRespondedBy.t() | nil,
          role: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :createdDt,
    :email,
    :expiryDate,
    :identifier,
    :invitedBy,
    :organization,
    :respondedBy,
    :role,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdDt: {:string, :date_time},
      email: {:string, :generic},
      expiryDate: {:string, :date},
      identifier: {:string, :generic},
      invitedBy: {User, :t},
      organization: {Organization, :t},
      respondedBy: {InvitationRespondedBy, :t},
      role: {:enum, ["admin", "member"]},
      status: {:enum, ["pending", "accepted", "declined"]}
    ]
  end
end
