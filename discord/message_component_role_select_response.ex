defmodule Discord.MessageComponentRoleSelectResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentRoleSelectResponse
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          disabled: boolean | nil,
          id: String.t(),
          max_values: integer | nil,
          min_values: integer | nil,
          placeholder: String.t() | nil,
          type: 6
        }

  defstruct [:custom_id, :disabled, :id, :max_values, :min_values, :placeholder, :type]

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
      placeholder: {:union, [:string, :null]},
      type: {:const, 6}
    ]
  end
end
