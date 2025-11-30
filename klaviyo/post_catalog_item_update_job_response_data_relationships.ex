defmodule Klaviyo.PostCatalogItemUpdateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogItemUpdateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.PostCatalogItemUpdateJobResponseDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.PostCatalogItemUpdateJobResponseDataRelationshipsItems, :t}]
  end
end
