defmodule GitHub.DependencyGraph.SpdxSbomSbomCreationInfo do
  @moduledoc """
  Provides struct and type for a DependencyGraph.SpdxSbomSbomCreationInfo
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, created: String.t(), creators: [String.t()]}

  defstruct [:__info__, :created, :creators]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: {:string, :generic}, creators: [string: :generic]]
  end
end
