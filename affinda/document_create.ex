defmodule DocumentCreate do
  @moduledoc """
  Provides struct and type for a DocumentCreate
  """

  @type t :: %__MODULE__{
          collection: String.t() | nil,
          compact: boolean | nil,
          customIdentifier: String.t() | nil,
          data: JobDescriptionData.t() | ResumeData.t() | nil,
          deleteAfterParse: boolean | nil,
          enableValidationTool: boolean | nil,
          expiryTime: DateTime.t() | nil,
          file: String.t() | nil,
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
      collection: {:string, :generic},
      compact: :boolean,
      customIdentifier: {:string, :generic},
      data: {:union, [{JobDescriptionData, :t}, {ResumeData, :t}]},
      deleteAfterParse: :boolean,
      enableValidationTool: :boolean,
      expiryTime: {:string, :date_time},
      file: {:string, :generic},
      fileName: {:string, :generic},
      identifier: {:string, :generic},
      language: {:string, :generic},
      lowPriority: :boolean,
      regionBias: {:string, :generic},
      rejectDuplicates: :boolean,
      url: {:string, :generic},
      wait: :boolean,
      workspace: {:string, :generic}
    ]
  end
end
