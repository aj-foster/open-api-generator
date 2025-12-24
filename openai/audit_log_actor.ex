defmodule OpenAI.AuditLogActor do
  @moduledoc """
  Provides struct and type for a AuditLogActor
  """

  @type t :: %__MODULE__{
          api_key: OpenAI.AuditLogActorApiKey.t() | nil,
          session: OpenAI.AuditLogActorSession.t() | nil,
          type: String.t() | nil
        }

  defstruct [:api_key, :session, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key: {OpenAI.AuditLogActorApiKey, :t},
      session: {OpenAI.AuditLogActorSession, :t},
      type: {:enum, ["session", "api_key"]}
    ]
  end
end
