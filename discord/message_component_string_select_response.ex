defmodule Discord.MessageComponentStringSelectResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentStringSelectResponse
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          disabled: boolean | nil,
          id: String.t(),
          max_values: integer | nil,
          min_values: integer | nil,
          options: [map | nil] | nil,
          placeholder: String.t() | nil,
          type: 3
        }

  defstruct [:custom_id, :disabled, :id, :max_values, :min_values, :options, :placeholder, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_id: :string,
      disabled: {:union, [:boolean, :null]},
      id: {:string, "snowflake"},
      max_values: {:union, [{:integer, "int32"}, :null]},
      min_values: {:union, [{:integer, "int32"}, :null]},
      options: {:union, [[union: [:map, :null]], :null]},
      placeholder: {:union, [:string, :null]},
      type: {:const, 3}
    ]
  end
end
