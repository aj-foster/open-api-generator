defmodule SavedShowObject do
  @moduledoc """
  Provides struct and type for a SavedShowObject
  """

  @type t :: %__MODULE__{added_at: DateTime.t() | nil, show: SavedShowObjectShow.t() | nil}

  defstruct [:added_at, :show]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [added_at: {:string, :date_time}, show: {SavedShowObjectShow, :t}]
  end
end
