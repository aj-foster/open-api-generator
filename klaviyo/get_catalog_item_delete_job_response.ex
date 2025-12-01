defmodule Klaviyo.GetCatalogItemDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a GetCatalogItemDeleteJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetCatalogItemDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetCatalogItemDeleteJobResponseData, :t}]
  end
end
