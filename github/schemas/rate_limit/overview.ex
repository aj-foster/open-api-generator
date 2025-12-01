defmodule GitHub.RateLimit.Overview do
  @moduledoc """
  Provides struct and type for a RateLimit.Overview
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          rate: GitHub.RateLimit.t(),
          resources: GitHub.RateLimit.OverviewResources.t()
        }

  defstruct [:__info__, :rate, :resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rate: {GitHub.RateLimit, :t}, resources: {GitHub.RateLimit.OverviewResources, :t}]
  end
end
