defmodule GitHub.Repository.Advisory.Identifiers do
  @moduledoc """
  Provides struct and type for a Repository.Advisory.Identifiers
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, type: String.t(), value: String.t()}

  defstruct [:__info__, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["CVE", "GHSA"]}, value: {:string, :generic}]
  end
end
