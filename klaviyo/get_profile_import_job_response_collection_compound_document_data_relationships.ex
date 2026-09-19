defmodule Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "import-errors":
            Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsImportErrors.t()
            | nil,
          lists:
            Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsLists.t()
            | nil,
          profiles:
            Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsProfiles.t()
            | nil
        }

  defstruct [:"import-errors", :lists, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "import-errors":
        {Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsImportErrors,
         :t},
      lists:
        {Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsLists, :t},
      profiles:
        {Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentDataRelationshipsProfiles,
         :t}
    ]
  end
end
