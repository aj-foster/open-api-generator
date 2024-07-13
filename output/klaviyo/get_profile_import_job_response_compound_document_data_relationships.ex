defmodule GetProfileImportJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "import-errors":
            :"Elixir.GetProfileImportJobResponseCompoundDocumentDataRelationshipsImport-errors".t()
            | nil,
          lists: GetProfileImportJobResponseCompoundDocumentDataRelationshipsLists.t() | nil,
          profiles: GetProfileImportJobResponseCompoundDocumentDataRelationshipsProfiles.t() | nil
        }

  defstruct [:"import-errors", :lists, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "import-errors":
        {:"Elixir.GetProfileImportJobResponseCompoundDocumentDataRelationshipsImport-errors", :t},
      lists: {GetProfileImportJobResponseCompoundDocumentDataRelationshipsLists, :t},
      profiles: {GetProfileImportJobResponseCompoundDocumentDataRelationshipsProfiles, :t}
    ]
  end
end
