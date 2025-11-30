defmodule Klaviyo.GetCatalogVariantDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantDeleteJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetCatalogVariantDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetCatalogVariantDeleteJobResponseData, :t}]
  end
end
