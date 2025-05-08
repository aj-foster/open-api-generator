defmodule GitHub.ReferrerTraffic do
  @moduledoc """
  Provides struct and type for a ReferrerTraffic
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, count: integer, referrer: String.t(), uniques: integer}

  defstruct [:__info__, :count, :referrer, :uniques]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, referrer: {:string, :generic}, uniques: :integer]
  end
end
