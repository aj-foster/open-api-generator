defmodule TeamMinimal do
  @moduledoc """
  Provides struct and type for a TeamMinimal
  """

  @type t :: %__MODULE__{id: String.t(), name: String.t(), slug: String.t()}

  defstruct [:id, :name, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, name: {:string, :generic}, slug: {:string, :generic}]
  end
end
