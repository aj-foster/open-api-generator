defmodule OpenAI.AuditLogProjectCreated do
  @moduledoc """
  Provides struct and type for a AuditLogProjectCreated
  """

  @type t :: %__MODULE__{data: OpenAI.AuditLogProjectCreatedData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAI.AuditLogProjectCreatedData, :t}, id: :string]
  end
end
