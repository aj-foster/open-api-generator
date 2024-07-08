defmodule GetCatalogItemCreateJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemCreateJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          items: GetCatalogItemCreateJobResponseCompoundDocumentDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogItemCreateJobResponseCompoundDocumentDataRelationshipsItems, :t}]
  end
end
