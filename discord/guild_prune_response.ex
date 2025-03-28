defmodule GuildPruneResponse do
  @moduledoc """
  Provides struct and type for a GuildPruneResponse
  """

  @type t :: %__MODULE__{pruned: integer | nil}

  defstruct [:pruned]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pruned: {:union, [:integer, :null]}]
  end
end
