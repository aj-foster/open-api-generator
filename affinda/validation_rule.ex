defmodule ValidationRule do
  @moduledoc """
  Provides struct and type for a ValidationRule
  """

  @type t :: %__MODULE__{dataPoints: [String.t()], slug: String.t()}

  defstruct [:dataPoints, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dataPoints: [string: :generic], slug: {:string, :generic}]
  end
end
