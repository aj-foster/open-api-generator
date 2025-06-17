defmodule CouponCodeCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{expires_at: DateTime.t() | nil, unique_code: String.t()}

  defstruct [:expires_at, :unique_code]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expires_at: {:string, :date_time}, unique_code: {:string, :generic}]
  end
end
