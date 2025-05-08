defmodule PostCatalogVariantUpdateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantUpdateJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogVariantUpdateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogVariantUpdateJobResponseData, :t}]
  end
end
