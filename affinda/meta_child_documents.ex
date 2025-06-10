defmodule MetaChildDocuments do
  @moduledoc """
  Provides struct and type for a MetaChildDocuments
  """

  @type t :: %__MODULE__{identifier: String.t() | nil}

  defstruct [:identifier]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: {:string, :generic}]
  end
end
