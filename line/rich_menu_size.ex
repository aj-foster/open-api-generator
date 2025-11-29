defmodule RichMenuSize do
  @moduledoc """
  Provides struct and type for a RichMenuSize
  """

  @type t :: %__MODULE__{height: integer | nil, width: integer | nil}

  defstruct [:height, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [height: :integer, width: :integer]
  end
end
