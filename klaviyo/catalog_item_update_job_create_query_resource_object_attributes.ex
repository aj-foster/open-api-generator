defmodule Klaviyo.CatalogItemUpdateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          items: Klaviyo.CatalogItemUpdateJobCreateQueryResourceObjectAttributesItems.t()
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.CatalogItemUpdateJobCreateQueryResourceObjectAttributesItems, :t}]
  end
end
