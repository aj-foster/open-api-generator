defmodule Affinda.WorkspaceCollections do
  @moduledoc """
  Provides struct and type for a WorkspaceCollections
  """

  @type t :: %__MODULE__{
          confirmedDocsCount: integer | nil,
          extractor: Affinda.WorkspaceCollectionsExtractor.t(),
          identifier: String.t(),
          name: String.t(),
          unvalidatedDocsCount: integer | nil
        }

  defstruct [:confirmedDocsCount, :extractor, :identifier, :name, :unvalidatedDocsCount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      confirmedDocsCount: :integer,
      extractor: {Affinda.WorkspaceCollectionsExtractor, :t},
      identifier: :string,
      name: :string,
      unvalidatedDocsCount: :integer
    ]
  end
end
