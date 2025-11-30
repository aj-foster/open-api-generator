defmodule Klaviyo.PostCatalogItemDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogItemDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.PostCatalogItemDeleteJobResponseDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.PostCatalogItemDeleteJobResponseDataRelationshipsItems, :t}]
  end
end
