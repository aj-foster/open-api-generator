defmodule OpenAI.Invite do
  @moduledoc """
  Provides struct and type for a Invite
  """

  @type t :: %__MODULE__{
          accepted_at: integer | nil,
          email: String.t(),
          expires_at: integer,
          id: String.t(),
          invited_at: integer,
          object: String.t(),
          projects: [OpenAI.InviteProjects.t()] | nil,
          role: String.t(),
          status: String.t()
        }

  defstruct [
    :accepted_at,
    :email,
    :expires_at,
    :id,
    :invited_at,
    :object,
    :projects,
    :role,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepted_at: :integer,
      email: :string,
      expires_at: :integer,
      id: :string,
      invited_at: :integer,
      object: {:const, "organization.invite"},
      projects: [{OpenAI.InviteProjects, :t}],
      role: {:enum, ["owner", "reader"]},
      status: {:enum, ["accepted", "expired", "pending"]}
    ]
  end
end
