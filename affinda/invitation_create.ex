defmodule InvitationCreate do
  @moduledoc """
  Provides struct and type for a InvitationCreate
  """

  @type t :: %__MODULE__{email: String.t(), organization: String.t(), role: String.t()}

  defstruct [:email, :organization, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :generic},
      organization: {:string, :generic},
      role: {:enum, ["admin", "member"]}
    ]
  end
end
