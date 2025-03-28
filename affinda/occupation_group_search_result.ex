defmodule OccupationGroupSearchResult do
  @moduledoc """
  Provides struct and type for a OccupationGroupSearchResult
  """

  @type t :: %__MODULE__{
          children: [OccupationGroup.t()] | nil,
          code: integer,
          match: boolean | nil,
          name: String.t(),
          parents: [OccupationGroup.t()] | nil
        }

  defstruct [:children, :code, :match, :name, :parents]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      children: [{OccupationGroup, :t}],
      code: :integer,
      match: :boolean,
      name: {:string, :generic},
      parents: [{OccupationGroup, :t}]
    ]
  end
end
