defmodule TagListOp do
  @moduledoc """
  Provides struct and type for a TagListOp
  """

  @type t :: %__MODULE__{data: [TagListOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{TagListOpData, :t}]]
  end
end
