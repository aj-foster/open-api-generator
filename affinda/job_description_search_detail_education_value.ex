defmodule JobDescriptionSearchDetailEducationValue do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailEducationValue
  """

  @type t :: %__MODULE__{
          degreeTypes: [String.t()] | nil,
          degrees: [String.t()] | nil,
          match: boolean | nil
        }

  defstruct [:degreeTypes, :degrees, :match]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [degreeTypes: [string: :generic], degrees: [string: :generic], match: :boolean]
  end
end
