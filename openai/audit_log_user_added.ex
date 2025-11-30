defmodule OpenAI.AuditLogUserAdded do
  @moduledoc """
  Provides struct and type for a AuditLogUserAdded
  """

  @type t :: %__MODULE__{data: OpenAI.AuditLogUserAddedData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAI.AuditLogUserAddedData, :t}, id: :string]
  end
end
