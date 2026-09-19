defmodule Typesense.SearchOverridesResponse do
  @moduledoc """
  Provides struct and type for a SearchOverridesResponse
  """

  @type t :: %__MODULE__{overrides: [Typesense.SearchOverride.t()]}

  defstruct [:overrides]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [overrides: [{Typesense.SearchOverride, :t}]]
  end
end
