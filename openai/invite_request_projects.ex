defmodule OpenAI.InviteRequestProjects do
  @moduledoc """
  Provides struct and type for a InviteRequestProjects
  """

  @type t :: %__MODULE__{id: String.t(), role: String.t()}

  defstruct [:id, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, role: {:enum, ["member", "owner"]}]
  end
end
