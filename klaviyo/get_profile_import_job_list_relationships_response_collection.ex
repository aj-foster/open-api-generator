defmodule Klaviyo.GetProfileImportJobListRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobListRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetProfileImportJobListRelationshipsResponseCollectionData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetProfileImportJobListRelationshipsResponseCollectionData, :t}]]
  end
end
