defmodule ProfileImportJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileImportJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfileImportJobCreateQueryResourceObjectAttributes.t(),
          relationships: ProfileImportJobCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfileImportJobCreateQueryResourceObjectAttributes, :t},
      relationships: {ProfileImportJobCreateQueryResourceObjectRelationships, :t},
      type: {:const, "profile-bulk-import-job"}
    ]
  end
end
