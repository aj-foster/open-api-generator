defmodule JobDescriptionSearchDetailLocation do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailLocation
  """

  @type t :: %__MODULE__{
          missing: [ResumeSearchParametersLocation.t()] | nil,
          value: JobDescriptionSearchDetailLocationValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{ResumeSearchParametersLocation, :t}],
      value: {JobDescriptionSearchDetailLocationValue, :t}
    ]
  end
end
