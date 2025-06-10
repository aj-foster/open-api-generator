defmodule AuditLogApiKeyUpdated do
  @moduledoc """
  Provides struct and type for a AuditLogApiKeyUpdated
  """

  @type t :: %__MODULE__{
          changes_requested: AuditLogApiKeyUpdatedChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [changes_requested: {AuditLogApiKeyUpdatedChangesRequested, :t}, id: {:string, :generic}]
  end
end
