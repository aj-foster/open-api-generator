defmodule ErrorObject do
  @moduledoc """
  Provides struct and type for a ErrorObject
  """

  @type t :: %__MODULE__{message: String.t(), status: integer}

  defstruct [:message, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:string, :generic}, status: :integer]
  end
end
