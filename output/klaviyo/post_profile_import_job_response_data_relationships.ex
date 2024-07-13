defmodule PostProfileImportJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostProfileImportJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "import-errors":
            :"Elixir.PostProfileImportJobResponseDataRelationshipsImport-errors".t() | nil,
          lists: PostProfileImportJobResponseDataRelationshipsLists.t() | nil,
          profiles: PostProfileImportJobResponseDataRelationshipsProfiles.t() | nil
        }

  defstruct [:"import-errors", :lists, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "import-errors": {:"Elixir.PostProfileImportJobResponseDataRelationshipsImport-errors", :t},
      lists: {PostProfileImportJobResponseDataRelationshipsLists, :t},
      profiles: {PostProfileImportJobResponseDataRelationshipsProfiles, :t}
    ]
  end
end
