defmodule GitHub.DependencyGraph.SpdxSbom do
  @moduledoc """
  Provides struct and type for a DependencyGraph.SpdxSbom
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, sbom: GitHub.DependencyGraph.SpdxSbomSbom.t()}

  defstruct [:__info__, :sbom]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sbom: {GitHub.DependencyGraph.SpdxSbomSbom, :t}]
  end
end
