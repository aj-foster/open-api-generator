defmodule GetProfileImportJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "import-errors":
            GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsImportErrors.t()
            | nil,
          lists:
            GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsLists.t() | nil,
          profiles:
            GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsProfiles.t()
            | nil
        }

  defstruct [:"import-errors", :lists, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "import-errors":
        {GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsImportErrors, :t},
      lists: {GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsLists, :t},
      profiles:
        {GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsProfiles, :t}
    ]
  end
end
