defmodule Sentry.BreadcrumbsData do
  @moduledoc """
  Provides struct and type for a BreadcrumbsData
  """

  @type t :: %__MODULE__{values: [Sentry.BreadcrumbsDataValues.t()]}

  defstruct [:values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [values: [{Sentry.BreadcrumbsDataValues, :t}]]
  end
end
