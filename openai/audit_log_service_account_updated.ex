defmodule OpenAI.AuditLogServiceAccountUpdated do
  @moduledoc """
  Provides struct and type for a AuditLogServiceAccountUpdated
  """

  @type t :: %__MODULE__{
          changes_requested: OpenAI.AuditLogServiceAccountUpdatedChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [changes_requested: {OpenAI.AuditLogServiceAccountUpdatedChangesRequested, :t}, id: :string]
  end
end
