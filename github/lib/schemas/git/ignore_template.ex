defmodule GitHub.Git.IgnoreTemplate do
  @moduledoc """
  Provides struct and type for a Git.IgnoreTemplate
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, name: String.t(), source: String.t()}

  defstruct [:__info__, :name, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, source: {:string, :generic}]
  end
end
