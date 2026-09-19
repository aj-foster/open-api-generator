defmodule Typesense.CollectionAliasesResponse do
  @moduledoc """
  Provides struct and type for a CollectionAliasesResponse
  """

  @type t :: %__MODULE__{aliases: [Typesense.CollectionAlias.t()]}

  defstruct [:aliases]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [aliases: [{Typesense.CollectionAlias, :t}]]
  end
end
