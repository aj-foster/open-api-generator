defmodule Discord.Button do
  @moduledoc """
  Provides struct and type for a Button
  """

  @type t :: %__MODULE__{
          custom_id: String.t() | nil,
          disabled: boolean | nil,
          emoji: Discord.Emoji.t() | nil,
          id: integer | nil,
          label: String.t() | nil,
          sku_id: String.t() | nil,
          style: integer,
          type: 2,
          url: String.t() | nil
        }

  defstruct [:custom_id, :disabled, :emoji, :id, :label, :sku_id, :style, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_id: {:union, [:string, :null]},
      disabled: {:union, [:boolean, :null]},
      emoji: {:union, [{Discord.Emoji, :t}, :null]},
      id: {:union, [{:integer, "int64"}, :null]},
      label: {:union, [:string, :null]},
      sku_id: {:union, [{:string, "snowflake"}, :null]},
      style: {:integer, "int32"},
      type: {:const, 2},
      url: {:union, [{:string, "uri"}, :null]}
    ]
  end
end
