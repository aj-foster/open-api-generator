defmodule OpenAI.AuditLogInviteSentData do
  @moduledoc """
  Provides struct and type for a AuditLogInviteSentData
  """

  @type t :: %__MODULE__{email: String.t() | nil, role: String.t() | nil}

  defstruct [:email, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: :string, role: :string]
  end
end
