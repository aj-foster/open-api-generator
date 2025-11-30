defmodule Klaviyo.PostProfileImportJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostProfileImportJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "import-errors":
            Klaviyo.PostProfileImportJobResponseDataRelationshipsImportErrors.t() | nil,
          lists: Klaviyo.PostProfileImportJobResponseDataRelationshipsLists.t() | nil,
          profiles: Klaviyo.PostProfileImportJobResponseDataRelationshipsProfiles.t() | nil
        }

  defstruct [:"import-errors", :lists, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "import-errors": {Klaviyo.PostProfileImportJobResponseDataRelationshipsImportErrors, :t},
      lists: {Klaviyo.PostProfileImportJobResponseDataRelationshipsLists, :t},
      profiles: {Klaviyo.PostProfileImportJobResponseDataRelationshipsProfiles, :t}
    ]
  end
end
