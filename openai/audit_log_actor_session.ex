defmodule AuditLogActorSession do
  @moduledoc """
  Provides struct and type for a AuditLogActorSession
  """

  @type t :: %__MODULE__{ip_address: String.t() | nil, user: AuditLogActorUser.t() | nil}

  defstruct [:ip_address, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ip_address: {:string, :generic}, user: {AuditLogActorUser, :t}]
  end
end
