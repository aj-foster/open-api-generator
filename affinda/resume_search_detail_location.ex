defmodule ResumeSearchDetailLocation do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailLocation
  """

  @type t :: %__MODULE__{
          missing: [ResumeSearchParametersLocation.t()] | nil,
          value: ResumeSearchDetailLocationValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{ResumeSearchParametersLocation, :t}],
      value: {ResumeSearchDetailLocationValue, :t}
    ]
  end
end
