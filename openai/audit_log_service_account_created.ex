defmodule AuditLogServiceAccountCreated do
  @moduledoc """
  Provides struct and type for a AuditLogServiceAccountCreated
  """

  @type t :: %__MODULE__{data: AuditLogServiceAccountCreatedData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AuditLogServiceAccountCreatedData, :t}, id: {:string, :generic}]
  end
end
