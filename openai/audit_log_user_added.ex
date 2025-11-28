defmodule AuditLogUserAdded do
  @moduledoc """
  Provides struct and type for a AuditLogUserAdded
  """

  @type t :: %__MODULE__{data: AuditLogUserAddedData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AuditLogUserAddedData, :t}, id: {:string, :generic}]
  end
end
