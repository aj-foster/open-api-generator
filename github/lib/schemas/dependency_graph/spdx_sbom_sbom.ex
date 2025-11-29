defmodule GitHub.DependencyGraph.SpdxSbomSbom do
  @moduledoc """
  Provides struct and type for a DependencyGraph.SpdxSbomSbom
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          SPDXID: String.t(),
          __info__: map,
          creationInfo: GitHub.DependencyGraph.SpdxSbomSbomCreationInfo.t(),
          dataLicense: String.t(),
          documentDescribes: [String.t()],
          documentNamespace: String.t(),
          name: String.t(),
          packages: [GitHub.DependencyGraph.SpdxSbomSbomPackages.t()],
          spdxVersion: String.t()
        }

  defstruct [
    :SPDXID,
    :__info__,
    :creationInfo,
    :dataLicense,
    :documentDescribes,
    :documentNamespace,
    :name,
    :packages,
    :spdxVersion
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SPDXID: {:string, :generic},
      creationInfo: {GitHub.DependencyGraph.SpdxSbomSbomCreationInfo, :t},
      dataLicense: {:string, :generic},
      documentDescribes: [string: :generic],
      documentNamespace: {:string, :generic},
      name: {:string, :generic},
      packages: [{GitHub.DependencyGraph.SpdxSbomSbomPackages, :t}],
      spdxVersion: {:string, :generic}
    ]
  end
end
