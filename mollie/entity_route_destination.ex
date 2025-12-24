defmodule Mollie.EntityRouteDestination do
  @moduledoc """
  Provides struct and type for a EntityRouteDestination
  """

  @type t :: %__MODULE__{organizationId: String.t(), type: String.t()}

  defstruct [:organizationId, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organizationId: :string, type: {:const, "organization"}]
  end
end
