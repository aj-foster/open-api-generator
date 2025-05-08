defmodule DocumentSplit do
  @moduledoc """
  Provides struct and type for a DocumentSplit
  """

  @type t :: %__MODULE__{
          identifier: DocumentSplitIdentifier.t() | nil,
          pages: [DocumentSplitPage.t()]
        }

  defstruct [:identifier, :pages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: {DocumentSplitIdentifier, :t}, pages: [{DocumentSplitPage, :t}]]
  end
end
