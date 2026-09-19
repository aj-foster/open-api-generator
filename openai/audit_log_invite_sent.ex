defmodule OpenAI.AuditLogInviteSent do
  @moduledoc """
  Provides struct and type for a AuditLogInviteSent
  """

  @type t :: %__MODULE__{data: OpenAI.AuditLogInviteSentData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAI.AuditLogInviteSentData, :t}, id: :string]
  end
end
