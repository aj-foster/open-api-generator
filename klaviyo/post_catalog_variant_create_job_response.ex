defmodule Klaviyo.PostCatalogVariantCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantCreateJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCatalogVariantCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCatalogVariantCreateJobResponseData, :t}]
  end
end
