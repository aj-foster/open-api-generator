defmodule GitHub.Repository.Advisory.Update do
  @moduledoc """
  Provides struct and type for a Repository.Advisory.Update
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          collaborating_teams: [String.t()] | nil,
          collaborating_users: [String.t()] | nil,
          credits: [map] | nil,
          cve_id: String.t() | nil,
          cvss_vector_string: String.t() | nil,
          cwe_ids: [String.t()] | nil,
          description: String.t() | nil,
          severity: String.t() | nil,
          state: String.t() | nil,
          summary: String.t() | nil,
          vulnerabilities: [GitHub.Repository.Advisory.UpdateVulnerabilities.t()] | nil
        }

  defstruct [
    :__info__,
    :collaborating_teams,
    :collaborating_users,
    :credits,
    :cve_id,
    :cvss_vector_string,
    :cwe_ids,
    :description,
    :severity,
    :state,
    :summary,
    :vulnerabilities
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collaborating_teams: {:union, [[string: :generic], :null]},
      collaborating_users: {:union, [[string: :generic], :null]},
      credits: {:union, [[:map], :null]},
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss_vector_string: {:union, [{:string, :generic}, :null]},
      cwe_ids: {:union, [[string: :generic], :null]},
      description: {:string, :generic},
      severity: {:enum, ["critical", "high", "medium", "low", nil]},
      state: {:enum, ["published", "closed", "draft"]},
      summary: {:string, :generic},
      vulnerabilities: [{GitHub.Repository.Advisory.UpdateVulnerabilities, :t}]
    ]
  end
end
