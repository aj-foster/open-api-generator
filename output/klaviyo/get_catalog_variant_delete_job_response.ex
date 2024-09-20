defmodule GetCatalogVariantDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantDeleteJobResponse
  """

  @type t :: %__MODULE__{data: GetCatalogVariantDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCatalogVariantDeleteJobResponseData, :t}]
  end
end
