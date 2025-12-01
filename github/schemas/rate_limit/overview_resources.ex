defmodule GitHub.RateLimit.OverviewResources do
  @moduledoc """
  Provides struct and type for a RateLimit.OverviewResources
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actions_runner_registration: GitHub.RateLimit.t() | nil,
          code_scanning_upload: GitHub.RateLimit.t() | nil,
          code_search: GitHub.RateLimit.t() | nil,
          core: GitHub.RateLimit.t(),
          dependency_snapshots: GitHub.RateLimit.t() | nil,
          graphql: GitHub.RateLimit.t() | nil,
          integration_manifest: GitHub.RateLimit.t() | nil,
          scim: GitHub.RateLimit.t() | nil,
          search: GitHub.RateLimit.t(),
          source_import: GitHub.RateLimit.t() | nil
        }

  defstruct [
    :__info__,
    :actions_runner_registration,
    :code_scanning_upload,
    :code_search,
    :core,
    :dependency_snapshots,
    :graphql,
    :integration_manifest,
    :scim,
    :search,
    :source_import
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions_runner_registration: {GitHub.RateLimit, :t},
      code_scanning_upload: {GitHub.RateLimit, :t},
      code_search: {GitHub.RateLimit, :t},
      core: {GitHub.RateLimit, :t},
      dependency_snapshots: {GitHub.RateLimit, :t},
      graphql: {GitHub.RateLimit, :t},
      integration_manifest: {GitHub.RateLimit, :t},
      scim: {GitHub.RateLimit, :t},
      search: {GitHub.RateLimit, :t},
      source_import: {GitHub.RateLimit, :t}
    ]
  end
end
