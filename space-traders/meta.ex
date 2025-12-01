defmodule SpaceTraders.Meta do
  @moduledoc """
  Provides struct and type for a Meta
  """

  @type t :: %__MODULE__{limit: integer, page: integer, total: integer}

  defstruct [:limit, :page, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [limit: :integer, page: :integer, total: :integer]
  end
end
