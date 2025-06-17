defmodule GitHub.Dependabot.Alert.Package do
  @moduledoc """
  Provides struct and type for a Dependabot.Alert.Package
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, ecosystem: String.t(), name: String.t()}

  defstruct [:__info__, :ecosystem, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ecosystem: {:string, :generic}, name: {:string, :generic}]
  end
end
