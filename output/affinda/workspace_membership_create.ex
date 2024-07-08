defmodule WorkspaceMembershipCreate do
  @moduledoc """
  Provides struct and type for a WorkspaceMembershipCreate
  """

  @type t :: %__MODULE__{user: integer | nil, workspace: String.t() | nil}

  defstruct [:user, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [user: :integer, workspace: {:string, :generic}]
  end
end
