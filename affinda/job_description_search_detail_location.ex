defmodule Affinda.JobDescriptionSearchDetailLocation do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailLocation
  """

  @type t :: %__MODULE__{
          missing: [Affinda.ResumeSearchParametersLocation.t()] | nil,
          value: Affinda.JobDescriptionSearchDetailLocationValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{Affinda.ResumeSearchParametersLocation, :t}],
      value: {Affinda.JobDescriptionSearchDetailLocationValue, :t}
    ]
  end
end
