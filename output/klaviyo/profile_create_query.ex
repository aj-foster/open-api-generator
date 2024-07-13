defmodule ProfileCreateQuery do
  @moduledoc """
  Provides struct and type for a ProfileCreateQuery
  """

  @type t :: %__MODULE__{data: ProfileCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ProfileCreateQueryResourceObject, :t}]
  end
end
