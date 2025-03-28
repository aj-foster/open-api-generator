defmodule GetCatalogItemDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a GetCatalogItemDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetCatalogItemDeleteJobResponseDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetCatalogItemDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-delete-job"}
    ]
  end
end
