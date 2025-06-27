defmodule GitHub.Repository.Advisory do
  @moduledoc """
  Provides struct and type for a Repository.Advisory
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: nil,
          closed_at: DateTime.t() | nil,
          collaborating_teams: [GitHub.Team.t()] | nil,
          collaborating_users: [GitHub.User.simple()] | nil,
          created_at: DateTime.t() | nil,
          credits: [map] | nil,
          credits_detailed: [map] | nil,
          cve_id: String.t() | nil,
          cvss: GitHub.Repository.Advisory.Cvss.t() | nil,
          cwe_ids: [String.t()] | nil,
          cwes: [map] | nil,
          description: String.t() | nil,
          ghsa_id: String.t(),
          html_url: String.t(),
          identifiers: [GitHub.Repository.Advisory.Identifiers.t()],
          private_fork: nil,
          published_at: DateTime.t() | nil,
          publisher: nil,
          severity: String.t() | nil,
          state: String.t(),
          submission: GitHub.Repository.Advisory.Submission.t() | nil,
          summary: String.t(),
          updated_at: DateTime.t() | nil,
          url: String.t(),
          vulnerabilities: [map] | nil,
          withdrawn_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :author,
    :closed_at,
    :collaborating_teams,
    :collaborating_users,
    :created_at,
    :credits,
    :credits_detailed,
    :cve_id,
    :cvss,
    :cwe_ids,
    :cwes,
    :description,
    :ghsa_id,
    :html_url,
    :identifiers,
    :private_fork,
    :published_at,
    :publisher,
    :severity,
    :state,
    :submission,
    :summary,
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
      author: :null,
      closed_at: {:union, [{:string, :date_time}, :null]},
      collaborating_teams: {:union, [[{GitHub.Team, :t}], :null]},
      collaborating_users: {:union, [[{GitHub.User, :simple}], :null]},
      created_at: {:union, [{:string, :date_time}, :null]},
      credits: {:union, [[:map], :null]},
      credits_detailed: {:union, [[:map], :null]},
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss: {:union, [{GitHub.Repository.Advisory.Cvss, :t}, :null]},
      cwe_ids: {:union, [[string: :generic], :null]},
      cwes: {:union, [[:map], :null]},
      description: {:union, [{:string, :generic}, :null]},
      ghsa_id: {:string, :generic},
      html_url: {:string, :uri},
      identifiers: [{GitHub.Repository.Advisory.Identifiers, :t}],
      private_fork: :null,
      published_at: {:union, [{:string, :date_time}, :null]},
      publisher: :null,
      severity: {:enum, ["critical", "high", "medium", "low", nil]},
      state: {:enum, ["published", "closed", "withdrawn", "draft", "triage"]},
      submission: {:union, [{GitHub.Repository.Advisory.Submission, :t}, :null]},
      summary: {:string, :generic},
      updated_at: {:union, [{:string, :date_time}, :null]},
      url: {:string, :uri},
      vulnerabilities: {:union, [[:map], :null]},
      withdrawn_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
