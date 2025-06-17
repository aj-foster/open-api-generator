defmodule HashSdk do
  @moduledoc """
  Provides struct and type for a HashSdk
  """

  @type t :: %__MODULE__{name: String.t() | nil, version: String.t() | nil}

  defstruct [:name, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, version: {:string, :generic}]
  end
end
