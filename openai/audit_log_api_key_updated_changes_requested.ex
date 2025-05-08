defmodule AuditLogApiKeyUpdatedChangesRequested do
  @moduledoc """
  Provides struct and type for a AuditLogApiKeyUpdatedChangesRequested
  """

  @type t :: %__MODULE__{scopes: [String.t()] | nil}

  defstruct [:scopes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [scopes: [string: :generic]]
  end
end
