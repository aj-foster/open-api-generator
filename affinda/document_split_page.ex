defmodule DocumentSplitPage do
  @moduledoc """
  Provides struct and type for a DocumentSplitPage
  """

  @type t :: %__MODULE__{id: integer, rotation: integer | nil}

  defstruct [:id, :rotation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, rotation: :integer]
  end
end
