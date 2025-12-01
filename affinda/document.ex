defmodule Affinda.Document do
  @moduledoc """
  Provides struct and type for a Document
  """

  @type t :: %__MODULE__{
          data: map | nil,
          error: Affinda.DocumentError.t() | nil,
          extractor: String.t(),
          meta: Affinda.DocumentMeta.t(),
          warnings: [Affinda.DocumentWarning.t()] | nil
        }

  defstruct [:data, :error, :extractor, :meta, :warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :map,
      error: {Affinda.DocumentError, :t},
      extractor: :string,
      meta: {Affinda.DocumentMeta, :t},
      warnings: [{Affinda.DocumentWarning, :t}]
    ]
  end
end
