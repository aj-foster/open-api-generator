defmodule Affinda.ResumeSearchDetailLocation do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailLocation
  """

  @type t :: %__MODULE__{
          missing: [Affinda.ResumeSearchParametersLocation.t()] | nil,
          value: Affinda.ResumeSearchDetailLocationValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{Affinda.ResumeSearchParametersLocation, :t}],
      value: {Affinda.ResumeSearchDetailLocationValue, :t}
    ]
  end
end
