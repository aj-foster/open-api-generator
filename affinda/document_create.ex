defmodule Affinda.DocumentCreate do
  @moduledoc """
  Provides struct and type for a DocumentCreate
  """

  @type t :: %__MODULE__{
          collection: String.t() | nil,
          compact: boolean | nil,
          customIdentifier: String.t() | nil,
          data: Affinda.JobDescriptionData.t() | Affinda.ResumeData.t() | nil,
          deleteAfterParse: boolean | nil,
          enableValidationTool: boolean | nil,
          expiryTime: DateTime.t() | nil,
          file: binary | nil,
          fileName: String.t() | nil,
          identifier: String.t() | nil,
          language: String.t() | nil,
          lowPriority: boolean | nil,
          regionBias: String.t() | nil,
          rejectDuplicates: boolean | nil,
          url: String.t() | nil,
          wait: boolean | nil,
          workspace: String.t() | nil
        }

  defstruct [
    :collection,
    :compact,
    :customIdentifier,
    :data,
    :deleteAfterParse,
    :enableValidationTool,
    :expiryTime,
    :file,
    :fileName,
    :identifier,
    :language,
    :lowPriority,
    :regionBias,
    :rejectDuplicates,
    :url,
    :wait,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collection: :string,
      compact: :boolean,
      customIdentifier: :string,
      data: {:union, [{Affinda.JobDescriptionData, :t}, {Affinda.ResumeData, :t}]},
      deleteAfterParse: :boolean,
      enableValidationTool: :boolean,
      expiryTime: {:string, "date-time"},
      file: {:string, "binary"},
      fileName: :string,
      identifier: :string,
      language: :string,
      lowPriority: :boolean,
      regionBias: :string,
      rejectDuplicates: :boolean,
      url: :string,
      wait: :boolean,
      workspace: :string
    ]
  end
end
