defmodule GitHub.PackageVersionMetadata do
  @moduledoc """
  Provides struct and type for a PackageVersionMetadata
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          container: GitHub.ContainerMetadata.t() | nil,
          docker: GitHub.DockerMetadata.t() | nil,
          package_type: String.t()
        }

  defstruct [:__info__, :container, :docker, :package_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      container: {GitHub.ContainerMetadata, :t},
      docker: {GitHub.DockerMetadata, :t},
      package_type: {:enum, ["npm", "maven", "rubygems", "docker", "nuget", "container"]}
    ]
  end
end
