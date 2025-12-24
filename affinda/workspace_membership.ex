defmodule Affinda.WorkspaceMembership do
  @moduledoc """
  Provides struct and type for a WorkspaceMembership
  """

  @type t :: %__MODULE__{
          identifier: String.t() | nil,
          user: Affinda.User.t() | nil,
          workspace: String.t() | nil
        }

  defstruct [:identifier, :user, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: :string, user: {Affinda.User, :t}, workspace: :string]
  end
end
