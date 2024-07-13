defmodule Breadcrumbs do
  @moduledoc """
  Provides struct and type for a Breadcrumbs
  """

  @type t :: %__MODULE__{data: BreadcrumbsData.t(), type: String.t()}

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {BreadcrumbsData, :t}, type: {:string, :generic}]
  end
end
