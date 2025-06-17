defmodule CatalogItemCreateJobCreateQueryResourceObjectAttributesItems do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateJobCreateQueryResourceObjectAttributesItems
  """

  @type t :: %__MODULE__{data: [CatalogItemCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogItemCreateQueryResourceObject, :t}]]
  end
end
