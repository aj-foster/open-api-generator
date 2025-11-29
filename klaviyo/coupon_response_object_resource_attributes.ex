defmodule CouponResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a CouponResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{description: String.t() | nil, external_id: String.t()}

  defstruct [:description, :external_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:string, :generic}, external_id: {:string, :generic}]
  end
end
