defmodule ApiUserWithKeyOrganizations do
  @moduledoc """
  Provides struct and type for a ApiUserWithKeyOrganizations
  """

  @type t :: %__MODULE__{identifier: String.t(), name: String.t()}

  defstruct [:identifier, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: {:string, :generic}, name: {:string, :generic}]
  end
end
