defmodule GitHub.Organization.ProgrammaticAccessGrant.Request do
  @moduledoc """
  Provides struct and type for a Organization.ProgrammaticAccessGrant.Request
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: String.t(),
          id: integer,
          owner: GitHub.User.simple(),
          permissions: GitHub.Organization.ProgrammaticAccessGrant.RequestPermissions.t(),
          reason: String.t() | nil,
          repositories_url: String.t(),
          repository_selection: String.t(),
          token_expired: boolean,
          token_expires_at: String.t() | nil,
          token_last_used_at: String.t() | nil
        }

  defstruct [
    :__info__,
    :created_at,
    :id,
    :owner,
    :permissions,
    :reason,
    :repositories_url,
    :repository_selection,
    :token_expired,
    :token_expires_at,
    :token_last_used_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :generic},
      id: :integer,
      owner: {GitHub.User, :simple},
      permissions: {GitHub.Organization.ProgrammaticAccessGrant.RequestPermissions, :t},
      reason: {:union, [{:string, :generic}, :null]},
      repositories_url: {:string, :generic},
      repository_selection: {:enum, ["none", "all", "subset"]},
      token_expired: :boolean,
      token_expires_at: {:union, [{:string, :generic}, :null]},
      token_last_used_at: {:union, [{:string, :generic}, :null]}
    ]
  end
end
