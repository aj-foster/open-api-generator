defmodule AuditLogServiceAccountUpdated do
  @moduledoc """
  Provides struct and type for a AuditLogServiceAccountUpdated
  """

  @type t :: %__MODULE__{
          changes_requested: AuditLogServiceAccountUpdatedChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      changes_requested: {AuditLogServiceAccountUpdatedChangesRequested, :t},
      id: {:string, :generic}
    ]
  end
end
