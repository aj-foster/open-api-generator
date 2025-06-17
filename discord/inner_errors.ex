defmodule InnerErrors do
  @moduledoc """
  Provides struct and type for a InnerErrors
  """

  @type t :: %__MODULE__{_errors: [Error.t()]}

  defstruct [:_errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [_errors: [{Error, :t}]]
  end
end
