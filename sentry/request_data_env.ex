defmodule RequestDataEnv do
  @moduledoc """
  Provides struct and type for a RequestDataEnv
  """

  @type t :: %__MODULE__{ENV: String.t() | nil}

  defstruct [:ENV]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ENV: {:string, :generic}]
  end
end
