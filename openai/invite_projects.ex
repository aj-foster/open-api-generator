defmodule OpenAI.InviteProjects do
  @moduledoc """
  Provides struct and type for a InviteProjects
  """

  @type t :: %__MODULE__{id: String.t() | nil, role: String.t() | nil}

  defstruct [:id, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, role: {:enum, ["member", "owner"]}]
  end
end
