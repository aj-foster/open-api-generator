defmodule Document do
  @moduledoc """
  Provides struct and type for a Document
  """

  @type t :: %__MODULE__{
          data: map | nil,
          error: DocumentError.t() | nil,
          extractor: String.t(),
          meta: DocumentMeta.t(),
          warnings: [DocumentWarning.t()] | nil
        }

  defstruct [:data, :error, :extractor, :meta, :warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :map,
      error: {DocumentError, :t},
      extractor: {:string, :generic},
      meta: {DocumentMeta, :t},
      warnings: [{DocumentWarning, :t}]
    ]
  end
end
