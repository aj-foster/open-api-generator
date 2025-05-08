defmodule ExpectedRemunerationAnnotationUpdateParsed do
  @moduledoc """
  Provides struct and type for a ExpectedRemunerationAnnotationUpdateParsed
  """

  @type t :: %__MODULE__{
          currency: String.t() | nil,
          maximum: number | nil,
          minimum: number | nil,
          unit: String.t() | nil
        }

  defstruct [:currency, :maximum, :minimum, :unit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [currency: {:string, :generic}, maximum: :number, minimum: :number, unit: {:string, :generic}]
  end
end
