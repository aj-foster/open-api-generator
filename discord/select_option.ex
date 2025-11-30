defmodule Discord.SelectOption do
  @moduledoc """
  Provides struct and type for a SelectOption
  """

  @type t :: %__MODULE__{
          default: boolean | nil,
          description: String.t() | nil,
          emoji: Discord.Emoji.t() | nil,
          label: String.t(),
          value: String.t()
        }

  defstruct [:default, :description, :emoji, :label, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default: {:union, [:boolean, :null]},
      description: {:union, [:string, :null]},
      emoji: {:union, [{Discord.Emoji, :t}, :null]},
      label: :string,
      value: :string
    ]
  end
end
