defmodule Klaviyo.PostCatalogItemResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogItemResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCatalogItemResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCatalogItemResponseData, :t}]
  end
end
