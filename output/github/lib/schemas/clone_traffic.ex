defmodule GitHub.CloneTraffic do
  @moduledoc """
  Provides struct and type for a CloneTraffic
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          clones: [GitHub.Traffic.t()],
          count: integer,
          uniques: integer
        }

  defstruct [:__info__, :clones, :count, :uniques]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [clones: [{GitHub.Traffic, :t}], count: :integer, uniques: :integer]
  end
end
