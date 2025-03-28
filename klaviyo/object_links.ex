defmodule ObjectLinks do
  @moduledoc """
  Provides struct and type for a ObjectLinks
  """

  @type t :: %__MODULE__{self: String.t()}

  defstruct [:self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [self: {:string, :uri}]
  end
end
