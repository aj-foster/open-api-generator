defmodule OpenAI.AuditLogApiKeyCreated do
  @moduledoc """
  Provides struct and type for a AuditLogApiKeyCreated
  """

  @type t :: %__MODULE__{data: OpenAI.AuditLogApiKeyCreatedData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAI.AuditLogApiKeyCreatedData, :t}, id: :string]
  end
end
