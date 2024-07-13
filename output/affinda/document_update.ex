defmodule DocumentUpdate do
  @moduledoc """
  Provides struct and type for a DocumentUpdate
  """

  @type t :: %__MODULE__{
          collection: String.t() | nil,
          customIdentifier: String.t() | nil,
          expiryTime: DateTime.t() | nil,
          fileName: String.t() | nil,
          identifier: String.t() | nil,
          isArchived: boolean | nil,
          isConfirmed: boolean | nil,
          isRejected: boolean | nil,
          language: String.t() | nil,
          skipParse: boolean | nil
        }

  defstruct [
    :collection,
    :customIdentifier,
    :expiryTime,
    :fileName,
    :identifier,
    :isArchived,
    :isConfirmed,
    :isRejected,
    :language,
    :skipParse
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collection: {:string, :generic},
      customIdentifier: {:string, :generic},
      expiryTime: {:string, :date_time},
      fileName: {:string, :generic},
      identifier: {:string, :generic},
      isArchived: :boolean,
      isConfirmed: :boolean,
      isRejected: :boolean,
      language: {:string, :generic},
      skipParse: :boolean
    ]
  end
end
