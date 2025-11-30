defmodule GitHub.SecurityAndAnalysis do
  @moduledoc """
  Provides struct and type for a SecurityAndAnalysis
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          advanced_security: GitHub.SecurityAndAnalysisAdvancedSecurity.t() | nil,
          dependabot_security_updates:
            GitHub.SecurityAndAnalysisDependabotSecurityUpdates.t() | nil,
          secret_scanning: GitHub.SecurityAndAnalysisSecretScanning.t() | nil,
          secret_scanning_push_protection:
            GitHub.SecurityAndAnalysisSecretScanningPushProtection.t() | nil
        }

  defstruct [
    :__info__,
    :advanced_security,
    :dependabot_security_updates,
    :secret_scanning,
    :secret_scanning_push_protection
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      advanced_security: {GitHub.SecurityAndAnalysisAdvancedSecurity, :t},
      dependabot_security_updates: {GitHub.SecurityAndAnalysisDependabotSecurityUpdates, :t},
      secret_scanning: {GitHub.SecurityAndAnalysisSecretScanning, :t},
      secret_scanning_push_protection:
        {GitHub.SecurityAndAnalysisSecretScanningPushProtection, :t}
    ]
  end
end
