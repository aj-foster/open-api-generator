defmodule Discord.ApplicationFormPartialDescription do
  @moduledoc """
  Provides struct and type for a ApplicationFormPartialDescription
  """

  @type t :: %__MODULE__{default: String.t(), localizations: map | nil}

  defstruct [:default, :localizations]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [default: :string, localizations: {:union, [:map, :null]}]
  end
end
