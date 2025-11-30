defmodule OpenAI.AuditLogOrganizationUpdated do
  @moduledoc """
  Provides struct and type for a AuditLogOrganizationUpdated
  """

  @type t :: %__MODULE__{
          changes_requested: OpenAI.AuditLogOrganizationUpdatedChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [changes_requested: {OpenAI.AuditLogOrganizationUpdatedChangesRequested, :t}, id: :string]
  end
end
