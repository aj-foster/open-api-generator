defmodule OrganizationDetailsQuota do
  @moduledoc """
  Provides struct and type for a OrganizationDetailsQuota
  """

  @type t :: %__MODULE__{
          accountLimit: integer | nil,
          maxRate: integer | nil,
          maxRateInterval: integer | nil,
          projectLimit: integer | nil
        }

  defstruct [:accountLimit, :maxRate, :maxRateInterval, :projectLimit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [accountLimit: :integer, maxRate: :integer, maxRateInterval: :integer, projectLimit: :integer]
  end
end
