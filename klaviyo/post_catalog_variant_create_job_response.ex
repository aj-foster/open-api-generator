defmodule PostCatalogVariantCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantCreateJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogVariantCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogVariantCreateJobResponseData, :t}]
  end
end
