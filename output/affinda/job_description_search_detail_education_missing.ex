defmodule JobDescriptionSearchDetailEducationMissing do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailEducationMissing
  """

  @type t :: %__MODULE__{degreeTypes: [String.t()] | nil, degrees: [String.t()] | nil}

  defstruct [:degreeTypes, :degrees]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [degreeTypes: [string: :generic], degrees: [string: :generic]]
  end
end
