defmodule PostCatalogVariantDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantDeleteJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogVariantDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogVariantDeleteJobResponseData, :t}]
  end
end
