defmodule GitHub.Team.ProjectPermissions do
  @moduledoc """
  Provides struct and type for a Team.ProjectPermissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, admin: boolean, read: boolean, write: boolean}

  defstruct [:__info__, :admin, :read, :write]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [admin: :boolean, read: :boolean, write: :boolean]
  end
end
