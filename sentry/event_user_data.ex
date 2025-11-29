defmodule EventUserData do
  @moduledoc """
  Provides struct and type for a EventUserData
  """

  @type t :: %__MODULE__{isStaff: boolean | nil}

  defstruct [:isStaff]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [isStaff: :boolean]
  end
end
