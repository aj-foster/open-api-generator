defmodule TagUpdate do
  @moduledoc """
  Provides struct and type for a TagUpdate
  """

  @type t :: %__MODULE__{name: String.t() | nil, workspace: String.t() | nil}

  defstruct [:name, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, workspace: {:string, :generic}]
  end
end
