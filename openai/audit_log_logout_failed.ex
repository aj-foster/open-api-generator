defmodule OpenAI.AuditLogLogoutFailed do
  @moduledoc """
  Provides struct and type for a AuditLogLogoutFailed
  """

  @type t :: %__MODULE__{error_code: String.t() | nil, error_message: String.t() | nil}

  defstruct [:error_code, :error_message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error_code: :string, error_message: :string]
  end
end
