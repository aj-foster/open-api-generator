defmodule SearchOverridesResponse do
  @moduledoc """
  Provides struct and type for a SearchOverridesResponse
  """

  @type t :: %__MODULE__{overrides: [SearchOverride.t()]}

  defstruct [:overrides]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [overrides: [{SearchOverride, :t}]]
  end
end
