defmodule GitHub.Check.SuitePreferencePreferences do
  @moduledoc """
  Provides struct and type for a Check.SuitePreferencePreferences
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          auto_trigger_checks:
            [GitHub.Check.SuitePreferencePreferencesAutoTriggerChecks.t()] | nil
        }

  defstruct [:__info__, :auto_trigger_checks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [auto_trigger_checks: [{GitHub.Check.SuitePreferencePreferencesAutoTriggerChecks, :t}]]
  end
end
