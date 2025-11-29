defmodule GetCatalogItemUpdateJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemUpdateJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          items: GetCatalogItemUpdateJobResponseCompoundDocumentDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogItemUpdateJobResponseCompoundDocumentDataRelationshipsItems, :t}]
  end
end
