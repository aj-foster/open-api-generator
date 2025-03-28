defmodule Meta do
  @moduledoc """
  Provides struct and type for a Meta
  """

  @type t :: %__MODULE__{
          childDocuments: [MetaChildDocuments.t()] | nil,
          createdDt: DateTime.t() | nil,
          customIdentifier: String.t() | nil,
          documentType: String.t() | nil,
          expiryTime: DateTime.t() | nil,
          failed: boolean | nil,
          fileName: String.t() | nil,
          identifier: String.t() | nil,
          isOcrd: boolean | nil,
          isVerified: boolean | nil,
          language: String.t() | nil,
          ocrConfidence: number | nil,
          pages: [PageMeta.t()] | nil,
          parentDocument: MetaParentDocument.t() | nil,
          pdf: String.t() | nil,
          ready: boolean | nil,
          readyDt: DateTime.t() | nil,
          regionBias: RegionBias.t() | nil,
          reviewUrl: String.t() | nil
        }

  defstruct [
    :childDocuments,
    :createdDt,
    :customIdentifier,
    :documentType,
    :expiryTime,
    :failed,
    :fileName,
    :identifier,
    :isOcrd,
    :isVerified,
    :language,
    :ocrConfidence,
    :pages,
    :parentDocument,
    :pdf,
    :ready,
    :readyDt,
    :regionBias,
    :reviewUrl
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      childDocuments: [{MetaChildDocuments, :t}],
      createdDt: {:string, :date_time},
      customIdentifier: {:string, :generic},
      documentType: {:string, :generic},
      expiryTime: {:string, :date_time},
      failed: :boolean,
      fileName: {:string, :generic},
      identifier: {:string, :generic},
      isOcrd: :boolean,
      isVerified: :boolean,
      language: {:string, :generic},
      ocrConfidence: :number,
      pages: [{PageMeta, :t}],
      parentDocument: {MetaParentDocument, :t},
      pdf: {:string, :generic},
      ready: :boolean,
      readyDt: {:string, :date_time},
      regionBias: {RegionBias, :t},
      reviewUrl: {:string, :generic}
    ]
  end
end
