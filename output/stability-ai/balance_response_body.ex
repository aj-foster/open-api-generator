defmodule BalanceResponseBody do
  @moduledoc """
  Provides struct and type for a BalanceResponseBody
  """

  @type t :: %__MODULE__{credits: number}

  defstruct [:credits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credits: :number]
  end
end
