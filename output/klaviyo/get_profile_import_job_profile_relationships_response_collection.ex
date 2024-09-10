defmodule GetProfileImportJobProfileRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobProfileRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{
          data: [GetProfileImportJobProfileRelationshipsResponseCollectionData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetProfileImportJobProfileRelationshipsResponseCollectionData, :t}]]
  end
end
