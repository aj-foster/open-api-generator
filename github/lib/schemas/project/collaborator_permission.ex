defmodule GitHub.Project.CollaboratorPermission do
  @moduledoc """
  Provides struct and type for a Project.CollaboratorPermission
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, permission: String.t(), user: GitHub.User.simple() | nil}

  defstruct [:__info__, :permission, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [permission: {:string, :generic}, user: {:union, [{GitHub.User, :simple}, :null]}]
  end
end
