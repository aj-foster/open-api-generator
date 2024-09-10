defmodule SearchResultRequestParams do
  @moduledoc """
  Provides struct and type for a SearchResultRequestParams
  """

  @type t :: %__MODULE__{collection_name: String.t(), per_page: integer, q: String.t()}

  defstruct [:collection_name, :per_page, :q]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [collection_name: {:string, :generic}, per_page: :integer, q: {:string, :generic}]
  end
end
