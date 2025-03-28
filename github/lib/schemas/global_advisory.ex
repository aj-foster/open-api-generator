defmodule GitHub.GlobalAdvisory do
  @moduledoc """
  Provides struct and type for a GlobalAdvisory
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credits: [map] | nil,
          cve_id: String.t() | nil,
          cvss: GitHub.GlobalAdvisoryCvss.t() | nil,
          cwes: [map] | nil,
          description: String.t() | nil,
          ghsa_id: String.t(),
          github_reviewed_at: DateTime.t() | nil,
          html_url: String.t(),
          identifiers: [map] | nil,
          nvd_published_at: DateTime.t() | nil,
          published_at: DateTime.t(),
          references: [String.t()] | nil,
          repository_advisory_url: String.t() | nil,
          severity: String.t(),
          source_code_location: String.t() | nil,
          summary: String.t(),
          type: String.t(),
          updated_at: DateTime.t(),
          url: String.t(),
          vulnerabilities: [map] | nil,
          withdrawn_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :credits,
    :cve_id,
    :cvss,
    :cwes,
    :description,
    :ghsa_id,
    :github_reviewed_at,
    :html_url,
    :identifiers,
    :nvd_published_at,
    :published_at,
    :references,
    :repository_advisory_url,
    :severity,
    :source_code_location,
    :summary,
    :type,
    :updated_at,
    :url,
    :vulnerabilities,
    :withdrawn_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credits: {:union, [[:map], :null]},
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss: {:union, [{GitHub.GlobalAdvisoryCvss, :t}, :null]},
      cwes: {:union, [[:map], :null]},
      description: {:union, [{:string, :generic}, :null]},
      ghsa_id: {:string, :generic},
      github_reviewed_at: {:union, [{:string, :date_time}, :null]},
      html_url: {:string, :uri},
      identifiers: {:union, [[:map], :null]},
      nvd_published_at: {:union, [{:string, :date_time}, :null]},
      published_at: {:string, :date_time},
      references: {:union, [[string: :generic], :null]},
      repository_advisory_url: {:union, [{:string, :uri}, :null]},
      severity: {:enum, ["critical", "high", "medium", "low", "unknown"]},
      source_code_location: {:union, [{:string, :uri}, :null]},
      summary: {:string, :generic},
      type: {:enum, ["reviewed", "unreviewed", "malware"]},
      updated_at: {:string, :date_time},
      url: {:string, :generic},
      vulnerabilities: {:union, [[:map], :null]},
      withdrawn_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
