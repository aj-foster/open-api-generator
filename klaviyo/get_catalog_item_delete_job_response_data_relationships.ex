defmodule GetCatalogItemDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{items: GetCatalogItemDeleteJobResponseDataRelationshipsItems.t() | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogItemDeleteJobResponseDataRelationshipsItems, :t}]
  end
end
