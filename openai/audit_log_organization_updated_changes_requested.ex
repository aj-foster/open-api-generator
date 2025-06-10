defmodule AuditLogOrganizationUpdatedChangesRequested do
  @moduledoc """
  Provides struct and type for a AuditLogOrganizationUpdatedChangesRequested
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          settings: AuditLogOrganizationUpdatedChangesRequestedSettings.t() | nil,
          title: String.t() | nil
        }

  defstruct [:description, :name, :settings, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      name: {:string, :generic},
      settings: {AuditLogOrganizationUpdatedChangesRequestedSettings, :t},
      title: {:string, :generic}
    ]
  end
end
