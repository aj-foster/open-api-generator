defmodule AuditLogApiKeyCreated do
  @moduledoc """
  Provides struct and type for a AuditLogApiKeyCreated
  """

  @type t :: %__MODULE__{data: AuditLogApiKeyCreatedData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AuditLogApiKeyCreatedData, :t}, id: {:string, :generic}]
  end
end
