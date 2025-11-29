defmodule ProfileImportJobCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a ProfileImportJobCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          lists: ProfileImportJobCreateQueryResourceObjectRelationshipsLists.t() | nil
        }

  defstruct [:lists]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lists: {ProfileImportJobCreateQueryResourceObjectRelationshipsLists, :t}]
  end
end
