defmodule ProfileImportJobCreateQueryResourceObjectRelationshipsLists do
  @moduledoc """
  Provides struct and type for a ProfileImportJobCreateQueryResourceObjectRelationshipsLists
  """

  @type t :: %__MODULE__{
          data: [ProfileImportJobCreateQueryResourceObjectRelationshipsListsData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ProfileImportJobCreateQueryResourceObjectRelationshipsListsData, :t}]]
  end
end
