defmodule OrganizationMembership do
  @moduledoc """
  Provides struct and type for a OrganizationMembership
  """

  @type t :: %__MODULE__{id: String.t(), is_default: boolean, name: String.t(), role: String.t()}

  defstruct [:id, :is_default, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      is_default: :boolean,
      name: {:string, :generic},
      role: {:string, :generic}
    ]
  end
end
