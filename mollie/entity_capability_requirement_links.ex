defmodule Mollie.EntityCapabilityRequirementLinks do
  @moduledoc """
  Provides struct and type for a EntityCapabilityRequirementLinks
  """

  @type t :: %__MODULE__{dashboard: Mollie.Url.t() | nil}

  defstruct [:dashboard]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dashboard: {Mollie.Url, :t}]
  end
end
