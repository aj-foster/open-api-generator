defmodule OpenAI.AuditLogUserAddedData do
  @moduledoc """
  Provides struct and type for a AuditLogUserAddedData
  """

  @type t :: %__MODULE__{role: String.t() | nil}

  defstruct [:role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [role: :string]
  end
end
