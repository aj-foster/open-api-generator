defmodule GitHub.Repository.CollaboratorPermission do
  @moduledoc """
  Provides struct and type for a Repository.CollaboratorPermission
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          permission: String.t(),
          role_name: String.t(),
          user: GitHub.Collaborator.t() | nil
        }

  defstruct [:__info__, :permission, :role_name, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      permission: {:string, :generic},
      role_name: {:string, :generic},
      user: {:union, [{GitHub.Collaborator, :t}, :null]}
    ]
  end
end
