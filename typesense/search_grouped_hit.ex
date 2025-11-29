defmodule SearchGroupedHit do
  @moduledoc """
  Provides struct and type for a SearchGroupedHit
  """

  @type t :: %__MODULE__{found: integer | nil, group_key: [map], hits: [SearchResultHit.t()]}

  defstruct [:found, :group_key, :hits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [found: :integer, group_key: [:map], hits: [{SearchResultHit, :t}]]
  end
end
