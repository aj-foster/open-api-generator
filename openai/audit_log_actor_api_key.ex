defmodule AuditLogActorApiKey do
  @moduledoc """
  Provides struct and type for a AuditLogActorApiKey
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          service_account: AuditLogActorServiceAccount.t() | nil,
          type: String.t() | nil,
          user: AuditLogActorUser.t() | nil
        }

  defstruct [:id, :service_account, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      service_account: {AuditLogActorServiceAccount, :t},
      type: {:enum, ["user", "service_account"]},
      user: {AuditLogActorUser, :t}
    ]
  end
end
