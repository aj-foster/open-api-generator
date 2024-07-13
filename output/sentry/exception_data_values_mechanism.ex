defmodule ExceptionDataValuesMechanism do
  @moduledoc """
  Provides struct and type for a ExceptionDataValuesMechanism
  """

  @type t :: %__MODULE__{handled: boolean | nil, type: String.t() | nil}

  defstruct [:handled, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [handled: :boolean, type: {:string, :generic}]
  end
end
