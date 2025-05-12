defmodule GitHub.Repository.Invitation do
  @moduledoc """
  Provides struct and type for a Repository.Invitation
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          expired: boolean | nil,
          html_url: String.t(),
          id: integer,
          invitee: GitHub.User.simple() | nil,
          inviter: GitHub.User.simple() | nil,
          node_id: String.t(),
          permissions: String.t(),
          repository: GitHub.Repository.minimal(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :expired,
    :html_url,
    :id,
    :invitee,
    :inviter,
    :node_id,
    :permissions,
    :repository,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      expired: :boolean,
      html_url: {:string, :generic},
      id: :integer,
      invitee: {:union, [{GitHub.User, :simple}, :null]},
      inviter: {:union, [{GitHub.User, :simple}, :null]},
      node_id: {:string, :generic},
      permissions: {:enum, ["read", "write", "admin", "triage", "maintain"]},
      repository: {GitHub.Repository, :minimal},
      url: {:string, :generic}
    ]
  end
end
