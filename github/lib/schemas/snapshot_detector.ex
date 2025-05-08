defmodule GitHub.SnapshotDetector do
  @moduledoc """
  Provides struct and type for a SnapshotDetector
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, name: String.t(), url: String.t(), version: String.t()}

  defstruct [:__info__, :name, :url, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, url: {:string, :generic}, version: {:string, :generic}]
  end
end
