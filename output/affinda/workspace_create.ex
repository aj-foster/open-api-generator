defmodule WorkspaceCreate do
  @moduledoc """
  Provides struct and type for a WorkspaceCreate
  """

  @type t :: %__MODULE__{
          documentSplitter: String.t() | nil,
          name: String.t(),
          organization: String.t(),
          rejectDuplicates: boolean | nil,
          rejectInvalidDocuments: boolean | nil,
          visibility: String.t() | nil,
          whitelistIngestAddresses: [String.t()] | nil
        }

  defstruct [
    :documentSplitter,
    :name,
    :organization,
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
      name: {:string, :generic},
      organization: {:string, :generic},
      rejectDuplicates: :boolean,
      rejectInvalidDocuments: :boolean,
      visibility: {:enum, ["organization", "private"]},
      whitelistIngestAddresses: [string: :generic]
    ]
  end
end
