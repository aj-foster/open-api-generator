defmodule ValidationToolConfig do
  @moduledoc """
  Provides struct and type for a ValidationToolConfig
  """

  @type t :: %__MODULE__{
          disableCurrencyFormatting: boolean | nil,
          disableEditDocumentMetadata: boolean | nil,
          hideActions: boolean | nil,
          hideCollection: boolean | nil,
          hideEditPages: boolean | nil,
          hideExport: boolean | nil,
          hideFilename: boolean | nil,
          hideReject: boolean | nil,
          hideReparse: boolean | nil,
          hideRunOcr: boolean | nil,
          hideTags: boolean | nil,
          hideWarnings: boolean | nil,
          restrictDocumentSplitting: boolean | nil,
          theme: ThemeConfig.t() | nil
        }

  defstruct [
    :disableCurrencyFormatting,
    :disableEditDocumentMetadata,
    :hideActions,
    :hideCollection,
    :hideEditPages,
    :hideExport,
    :hideFilename,
    :hideReject,
    :hideReparse,
    :hideRunOcr,
    :hideTags,
    :hideWarnings,
    :restrictDocumentSplitting,
    :theme
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      disableCurrencyFormatting: :boolean,
      disableEditDocumentMetadata: :boolean,
      hideActions: :boolean,
      hideCollection: :boolean,
      hideEditPages: :boolean,
      hideExport: :boolean,
      hideFilename: :boolean,
      hideReject: :boolean,
      hideReparse: :boolean,
      hideRunOcr: :boolean,
      hideTags: :boolean,
      hideWarnings: :boolean,
      restrictDocumentSplitting: :boolean,
      theme: {ThemeConfig, :t}
    ]
  end
end
