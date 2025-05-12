defmodule GitHub.Repository.Ruleset.ConditionsRepositoryPropertySpec do
  @moduledoc """
  Provides struct and type for a Repository.Ruleset.ConditionsRepositoryPropertySpec
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, name: String.t(), property_values: [String.t()]}

  defstruct [:__info__, :name, :property_values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, property_values: [string: :generic]]
  end
end
