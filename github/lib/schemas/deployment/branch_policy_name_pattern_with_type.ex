defmodule GitHub.Deployment.BranchPolicyNamePatternWithType do
  @moduledoc """
  Provides struct and type for a Deployment.BranchPolicyNamePatternWithType
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, name: String.t(), type: String.t() | nil}

  defstruct [:__info__, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, type: {:enum, ["branch", "tag"]}]
  end
end
