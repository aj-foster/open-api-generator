defmodule InteractionApplicationCommandAutocompleteCallbackNumberData do
  @moduledoc """
  Provides struct and type for a InteractionApplicationCommandAutocompleteCallbackNumberData
  """

  @type t :: %__MODULE__{choices: [map | nil] | nil}

  defstruct [:choices]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [choices: {:union, [[union: [:map, :null]], :null]}]
  end
end
