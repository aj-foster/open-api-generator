defmodule ProfileMergeQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileMergeQueryResourceObject
  """

  @type t :: %__MODULE__{
          id: String.t(),
          relationships: ProfileMergeQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:id, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      relationships: {ProfileMergeQueryResourceObjectRelationships, :t},
      type: {:const, "profile-merge"}
    ]
  end
end
