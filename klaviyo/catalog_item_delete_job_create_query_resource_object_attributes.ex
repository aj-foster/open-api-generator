defmodule CatalogItemDeleteJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogItemDeleteJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{items: CatalogItemDeleteJobCreateQueryResourceObjectAttributesItems.t()}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {CatalogItemDeleteJobCreateQueryResourceObjectAttributesItems, :t}]
  end
end
