defmodule CouponUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CouponUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{description: String.t() | nil}

  defstruct [:description]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:string, :generic}]
  end
end
