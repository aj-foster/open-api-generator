defmodule PostCatalogItemUpdateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogItemUpdateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{items: PostCatalogItemUpdateJobResponseDataRelationshipsItems.t() | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {PostCatalogItemUpdateJobResponseDataRelationshipsItems, :t}]
  end
end
