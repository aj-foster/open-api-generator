defmodule Affinda.WorkspaceUpdate do
  @moduledoc """
  Provides struct and type for a WorkspaceUpdate
  """

  @type t :: %__MODULE__{
          documentSplitter: String.t() | nil,
          name: String.t() | nil,
          rejectDuplicates: boolean | nil,
          rejectInvalidDocuments: boolean | nil,
          visibility: String.t() | nil,
          whitelistIngestAddresses: [String.t()] | nil
        }

  defstruct [
    :documentSplitter,
    :name,
    :rejectDuplicates,
    :rejectInvalidDocuments,
    :visibility,
    :whitelistIngestAddresses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentSplitter: {:enum, ["leave", "conservative", "recommended", "aggressive"]},
      name: :string,
      rejectDuplicates: :boolean,
      rejectInvalidDocuments: :boolean,
      visibility: {:enum, ["organization", "private"]},
      whitelistIngestAddresses: [:string]
    ]
  end
end
