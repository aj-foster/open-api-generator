defmodule GitHub.ViewTraffic do
  @moduledoc """
  Provides struct and type for a ViewTraffic
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          count: integer,
          uniques: integer,
          views: [GitHub.Traffic.t()]
        }

  defstruct [:__info__, :count, :uniques, :views]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, uniques: :integer, views: [{GitHub.Traffic, :t}]]
  end
end
