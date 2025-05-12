defmodule GitHub.Repository.Advisory.UpdateVulnerabilities do
  @moduledoc """
  Provides struct and type for a Repository.Advisory.UpdateVulnerabilities
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          package: GitHub.Repository.Advisory.UpdateVulnerabilitiesPackage.t(),
          patched_versions: String.t() | nil,
          vulnerable_functions: [String.t()] | nil,
          vulnerable_version_range: String.t() | nil
        }

  defstruct [
    :__info__,
    :package,
    :patched_versions,
    :vulnerable_functions,
    :vulnerable_version_range
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      package: {GitHub.Repository.Advisory.UpdateVulnerabilitiesPackage, :t},
      patched_versions: {:union, [{:string, :generic}, :null]},
      vulnerable_functions: {:union, [[string: :generic], :null]},
      vulnerable_version_range: {:union, [{:string, :generic}, :null]}
    ]
  end
end
