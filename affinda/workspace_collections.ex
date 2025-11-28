defmodule WorkspaceCollections do
  @moduledoc """
  Provides struct and type for a WorkspaceCollections
  """

  @type t :: %__MODULE__{
          confirmedDocsCount: integer | nil,
          extractor: WorkspaceCollectionsExtractor.t(),
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
      extractor: {WorkspaceCollectionsExtractor, :t},
      identifier: {:string, :generic},
      name: {:string, :generic},
      unvalidatedDocsCount: :integer
    ]
  end
end
