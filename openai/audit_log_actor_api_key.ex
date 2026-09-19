defmodule OpenAI.AuditLogActorApiKey do
  @moduledoc """
  Provides struct and type for a AuditLogActorApiKey
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          service_account: OpenAI.AuditLogActorServiceAccount.t() | nil,
          type: String.t() | nil,
          user: OpenAI.AuditLogActorUser.t() | nil
        }

  defstruct [:id, :service_account, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      service_account: {OpenAI.AuditLogActorServiceAccount, :t},
      type: {:enum, ["user", "service_account"]},
      user: {OpenAI.AuditLogActorUser, :t}
    ]
  end
end
