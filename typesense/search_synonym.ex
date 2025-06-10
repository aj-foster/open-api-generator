defmodule SearchSynonym do
  @moduledoc """
  Provides struct and type for a SearchSynonym
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          root: String.t() | nil,
          synonyms: [String.t()] | nil
        }

  defstruct [:id, :root, :synonyms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, root: {:string, :generic}, synonyms: [string: :generic]]
  end
end
