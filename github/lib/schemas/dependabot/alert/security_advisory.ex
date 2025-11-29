defmodule GitHub.Dependabot.Alert.SecurityAdvisory do
  @moduledoc """
  Provides struct and type for a Dependabot.Alert.SecurityAdvisory
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          cve_id: String.t() | nil,
          cvss: GitHub.Dependabot.Alert.SecurityAdvisoryCvss.t(),
          cwes: [GitHub.Dependabot.Alert.SecurityAdvisoryCwes.t()],
          description: String.t(),
          ghsa_id: String.t(),
          identifiers: [GitHub.Dependabot.Alert.SecurityAdvisoryIdentifiers.t()],
          published_at: DateTime.t(),
          references: [GitHub.Dependabot.Alert.SecurityAdvisoryReferences.t()],
          severity: String.t(),
          summary: String.t(),
          updated_at: DateTime.t(),
          vulnerabilities: [GitHub.Dependabot.Alert.SecurityVulnerability.t()],
          withdrawn_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :cve_id,
    :cvss,
    :cwes,
    :description,
    :ghsa_id,
    :identifiers,
    :published_at,
    :references,
    :severity,
    :summary,
    :updated_at,
    :vulnerabilities,
    :withdrawn_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss: {GitHub.Dependabot.Alert.SecurityAdvisoryCvss, :t},
      cwes: [{GitHub.Dependabot.Alert.SecurityAdvisoryCwes, :t}],
      description: {:string, :generic},
      ghsa_id: {:string, :generic},
      identifiers: [{GitHub.Dependabot.Alert.SecurityAdvisoryIdentifiers, :t}],
      published_at: {:string, :date_time},
      references: [{GitHub.Dependabot.Alert.SecurityAdvisoryReferences, :t}],
      severity: {:enum, ["low", "medium", "high", "critical"]},
      summary: {:string, :generic},
      updated_at: {:string, :date_time},
      vulnerabilities: [{GitHub.Dependabot.Alert.SecurityVulnerability, :t}],
      withdrawn_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
