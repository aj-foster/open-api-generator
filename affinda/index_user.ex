defmodule Affinda.IndexUser do
  @moduledoc """
  Provides struct and type for a IndexUser
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          email: String.t(),
          id: integer,
          name: String.t()
        }

  defstruct [:avatar, :email, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [avatar: :string, email: :string, id: :integer, name: :string]
  end
end
