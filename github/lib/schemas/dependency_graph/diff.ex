defmodule GitHub.DependencyGraph.Diff do
  @moduledoc """
  Provides struct and type for a DependencyGraph.Diff
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          change_type: String.t(),
          ecosystem: String.t(),
          license: String.t() | nil,
          manifest: String.t(),
          name: String.t(),
          package_url: String.t() | nil,
          scope: String.t(),
          source_repository_url: String.t() | nil,
          version: String.t(),
          vulnerabilities: [GitHub.DependencyGraph.DiffVulnerabilities.t()]
        }

  defstruct [
    :__info__,
    :change_type,
    :ecosystem,
    :license,
    :manifest,
    :name,
    :package_url,
    :scope,
    :source_repository_url,
    :version,
    :vulnerabilities
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      change_type: {:enum, ["added", "removed"]},
      ecosystem: {:string, :generic},
      license: {:union, [{:string, :generic}, :null]},
      manifest: {:string, :generic},
      name: {:string, :generic},
      package_url: {:union, [{:string, :generic}, :null]},
      scope: {:enum, ["unknown", "runtime", "development"]},
      source_repository_url: {:union, [{:string, :generic}, :null]},
      version: {:string, :generic},
      vulnerabilities: [{GitHub.DependencyGraph.DiffVulnerabilities, :t}]
    ]
  end
end
