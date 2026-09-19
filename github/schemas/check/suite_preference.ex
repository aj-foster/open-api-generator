defmodule GitHub.Check.SuitePreference do
  @moduledoc """
  Provides struct and type for a Check.SuitePreference
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          preferences: GitHub.Check.SuitePreferencePreferences.t(),
          repository: GitHub.Repository.minimal()
        }

  defstruct [:__info__, :preferences, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      preferences: {GitHub.Check.SuitePreferencePreferences, :t},
      repository: {GitHub.Repository, :minimal}
    ]
  end
end
