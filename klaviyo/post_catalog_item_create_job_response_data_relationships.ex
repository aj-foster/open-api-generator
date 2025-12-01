defmodule Klaviyo.PostCatalogItemCreateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogItemCreateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.PostCatalogItemCreateJobResponseDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.PostCatalogItemCreateJobResponseDataRelationshipsItems, :t}]
  end
end
