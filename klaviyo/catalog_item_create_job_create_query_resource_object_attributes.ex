defmodule Klaviyo.CatalogItemCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          items: Klaviyo.CatalogItemCreateJobCreateQueryResourceObjectAttributesItems.t()
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.CatalogItemCreateJobCreateQueryResourceObjectAttributesItems, :t}]
  end
end
