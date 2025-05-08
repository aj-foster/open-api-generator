defmodule VanityURLErrorResponse do
  @moduledoc """
  Provides struct and type for a VanityURLErrorResponse
  """

  @type t :: %__MODULE__{code: integer, message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :integer, message: {:string, :generic}]
  end
end
