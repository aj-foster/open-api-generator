defmodule GuildMFALevelResponse do
  @moduledoc """
  Provides struct and type for a GuildMFALevelResponse
  """

  @type t :: %__MODULE__{level: integer}

  defstruct [:level]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [level: :integer]
  end
end
