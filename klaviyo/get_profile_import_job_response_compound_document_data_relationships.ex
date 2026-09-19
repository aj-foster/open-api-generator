defmodule Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "import-errors":
            Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationshipsImportErrors.t()
            | nil,
          lists:
            Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationshipsLists.t() | nil,
          profiles:
            Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationshipsProfiles.t() | nil
        }

  defstruct [:"import-errors", :lists, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "import-errors":
        {Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationshipsImportErrors, :t},
      lists: {Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationshipsLists, :t},
      profiles: {Klaviyo.GetProfileImportJobResponseCompoundDocumentDataRelationshipsProfiles, :t}
    ]
  end
end
