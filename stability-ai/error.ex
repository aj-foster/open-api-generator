defmodule Error do
  @moduledoc """
  Provides struct and type for a Error
  """

  @type t :: %__MODULE__{id: String.t(), message: String.t(), name: String.t()}

  defstruct [:id, :message, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, message: {:string, :generic}, name: {:string, :generic}]
  end
end
