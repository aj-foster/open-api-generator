defmodule Affinda.OccupationGroupSearchResult do
  @moduledoc """
  Provides struct and type for a OccupationGroupSearchResult
  """

  @type t :: %__MODULE__{
          children: [Affinda.OccupationGroup.t()] | nil,
          code: integer,
          match: boolean | nil,
          name: String.t(),
          parents: [Affinda.OccupationGroup.t()] | nil
        }

  defstruct [:children, :code, :match, :name, :parents]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      children: [{Affinda.OccupationGroup, :t}],
      code: :integer,
      match: :boolean,
      name: :string,
      parents: [{Affinda.OccupationGroup, :t}]
    ]
  end
end
