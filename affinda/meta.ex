defmodule Affinda.Meta do
  @moduledoc """
  Provides struct and type for a Meta
  """

  @type t :: %__MODULE__{
          childDocuments: [Affinda.MetaChildDocuments.t()] | nil,
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
          pages: [Affinda.PageMeta.t()] | nil,
          parentDocument: Affinda.MetaParentDocument.t() | nil,
          pdf: String.t() | nil,
          ready: boolean | nil,
          readyDt: DateTime.t() | nil,
          regionBias: Affinda.RegionBias.t() | nil,
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
      childDocuments: [{Affinda.MetaChildDocuments, :t}],
      createdDt: {:string, "date-time"},
      customIdentifier: :string,
      documentType: :string,
      expiryTime: {:string, "date-time"},
      failed: :boolean,
      fileName: :string,
      identifier: :string,
      isOcrd: :boolean,
      isVerified: :boolean,
      language: :string,
      ocrConfidence: :number,
      pages: [{Affinda.PageMeta, :t}],
      parentDocument: {Affinda.MetaParentDocument, :t},
      pdf: :string,
      ready: :boolean,
      readyDt: {:string, "date-time"},
      regionBias: {Affinda.RegionBias, :t},
      reviewUrl: :string
    ]
  end
end
