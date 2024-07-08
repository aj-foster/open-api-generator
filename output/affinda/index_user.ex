defmodule IndexUser do
  @moduledoc """
  Provides struct and type for a IndexUser
  """

  @type t :: %__MODULE__{avatar: String.t(), email: String.t(), id: integer, name: String.t()}

  defstruct [:avatar, :email, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:string, :generic},
      email: {:string, :generic},
      id: :integer,
      name: {:string, :generic}
    ]
  end
end
