defmodule Affinda.Workspace do
  @moduledoc """
  Provides struct and type for a Workspace
  """

  @type t :: %__MODULE__{
          collections: [Affinda.WorkspaceCollections.t()] | nil,
          confirmedDocsCount: integer | nil,
          documentSplitter: String.t() | nil,
          identifier: String.t(),
          ingestEmail: String.t() | nil,
          members: [Affinda.User.t()] | nil,
          name: String.t() | nil,
          organization: Affinda.Organization.t() | nil,
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
      collections: [{Affinda.WorkspaceCollections, :t}],
      confirmedDocsCount: :integer,
      documentSplitter: {:enum, ["leave", "conservative", "recommended", "aggressive"]},
      identifier: :string,
      ingestEmail: :string,
      members: [{Affinda.User, :t}],
      name: :string,
      organization: {Affinda.Organization, :t},
      rejectDuplicates: :boolean,
      rejectInvalidDocuments: :boolean,
      unvalidatedDocsCount: :integer,
      visibility: {:enum, ["organization", "private"]},
      whitelistIngestAddresses: [:string]
    ]
  end
end
