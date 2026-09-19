defmodule Affinda.DocumentSplit do
  @moduledoc """
  Provides struct and type for a DocumentSplit
  """

  @type t :: %__MODULE__{
          identifier: Affinda.DocumentSplitIdentifier.t() | nil,
          pages: [Affinda.DocumentSplitPage.t()]
        }

  defstruct [:identifier, :pages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: {Affinda.DocumentSplitIdentifier, :t}, pages: [{Affinda.DocumentSplitPage, :t}]]
  end
end
