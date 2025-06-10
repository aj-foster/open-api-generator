defmodule Workspace do
  @moduledoc """
  Provides struct and type for a Workspace
  """

  @type t :: %__MODULE__{
          collections: [WorkspaceCollections.t()] | nil,
          confirmedDocsCount: integer | nil,
          documentSplitter: String.t() | nil,
          identifier: String.t(),
          ingestEmail: String.t() | nil,
          members: [User.t()] | nil,
          name: String.t() | nil,
          organization: Organization.t() | nil,
          rejectDuplicates: boolean | nil,
          rejectInvalidDocuments: boolean | nil,
          unvalidatedDocsCount: integer | nil,
          visibility: String.t() | nil,
          whitelistIngestAddresses: [String.t()] | nil
        }

  defstruct [
    :collections,
    :confirmedDocsCount,
    :documentSplitter,
    :identifier,
    :ingestEmail,
    :members,
    :name,
    :organization,
    :rejectDuplicates,
    :rejectInvalidDocuments,
    :unvalidatedDocsCount,
    :visibility,
    :whitelistIngestAddresses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collections: [{WorkspaceCollections, :t}],
      confirmedDocsCount: :integer,
      documentSplitter: {:enum, ["leave", "conservative", "recommended", "aggressive"]},
      identifier: {:string, :generic},
      ingestEmail: {:string, :generic},
      members: [{User, :t}],
      name: {:string, :generic},
      organization: {Organization, :t},
      rejectDuplicates: :boolean,
      rejectInvalidDocuments: :boolean,
      unvalidatedDocsCount: :integer,
      visibility: {:enum, ["organization", "private"]},
      whitelistIngestAddresses: [string: :generic]
    ]
  end
end
