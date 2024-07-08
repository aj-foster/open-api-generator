defmodule GitHub.Dependabot.Alert.WithRepository do
  @moduledoc """
  Provides struct and type for a Dependabot.Alert.WithRepository
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          auto_dismissed_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          dependency: GitHub.Dependabot.Alert.WithRepositoryDependency.t(),
          dismissed_at: DateTime.t() | nil,
          dismissed_by: GitHub.User.simple() | nil,
          dismissed_comment: String.t() | nil,
          dismissed_reason: String.t() | nil,
          fixed_at: DateTime.t() | nil,
          html_url: String.t(),
          number: integer,
          repository: GitHub.Repository.simple(),
          security_advisory: GitHub.Dependabot.Alert.SecurityAdvisory.t(),
          security_vulnerability: GitHub.Dependabot.Alert.SecurityVulnerability.t(),
          state: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :auto_dismissed_at,
    :created_at,
    :dependency,
    :dismissed_at,
    :dismissed_by,
    :dismissed_comment,
    :dismissed_reason,
    :fixed_at,
    :html_url,
    :number,
    :repository,
    :security_advisory,
    :security_vulnerability,
    :state,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auto_dismissed_at: {:union, [{:string, :date_time}, :null]},
      created_at: {:string, :date_time},
      dependency: {GitHub.Dependabot.Alert.WithRepositoryDependency, :t},
      dismissed_at: {:union, [{:string, :date_time}, :null]},
      dismissed_by: {:union, [{GitHub.User, :simple}, :null]},
      dismissed_comment: {:union, [{:string, :generic}, :null]},
      dismissed_reason:
        {:enum, ["fix_started", "inaccurate", "no_bandwidth", "not_used", "tolerable_risk", nil]},
      fixed_at: {:union, [{:string, :date_time}, :null]},
      html_url: {:string, :uri},
      number: :integer,
      repository: {GitHub.Repository, :simple},
      security_advisory: {GitHub.Dependabot.Alert.SecurityAdvisory, :t},
      security_vulnerability: {GitHub.Dependabot.Alert.SecurityVulnerability, :t},
      state: {:enum, ["auto_dismissed", "dismissed", "fixed", "open"]},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
