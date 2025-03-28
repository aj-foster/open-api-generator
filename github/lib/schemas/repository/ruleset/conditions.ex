defmodule GitHub.Repository.Ruleset.Conditions do
  @moduledoc """
  Provides struct and type for a Repository.Ruleset.Conditions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, ref_name: map | nil}

  defstruct [:__info__, :ref_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ref_name: :map]
  end
end
