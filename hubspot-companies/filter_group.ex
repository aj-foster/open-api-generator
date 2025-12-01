defmodule HubSpot.Companies.FilterGroup do
  @moduledoc """
  Provides struct and type for a FilterGroup
  """

  @type t :: %__MODULE__{filters: [HubSpot.Companies.Filter.t()]}

  defstruct [:filters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filters: [{HubSpot.Companies.Filter, :t}]]
  end
end
