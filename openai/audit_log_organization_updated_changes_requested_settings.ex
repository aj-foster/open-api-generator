defmodule OpenAI.AuditLogOrganizationUpdatedChangesRequestedSettings do
  @moduledoc """
  Provides struct and type for a AuditLogOrganizationUpdatedChangesRequestedSettings
  """

  @type t :: %__MODULE__{
          threads_ui_visibility: String.t() | nil,
          usage_dashboard_visibility: String.t() | nil
        }

  defstruct [:threads_ui_visibility, :usage_dashboard_visibility]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [threads_ui_visibility: :string, usage_dashboard_visibility: :string]
  end
end
