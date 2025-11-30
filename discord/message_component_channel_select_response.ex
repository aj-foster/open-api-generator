defmodule Discord.MessageComponentChannelSelectResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentChannelSelectResponse
  """

  @type t :: %__MODULE__{
          channel_types: [integer] | nil,
          custom_id: String.t(),
          disabled: boolean | nil,
          id: String.t(),
          max_values: integer | nil,
          min_values: integer | nil,
          placeholder: String.t() | nil,
          type: 8
        }

  defstruct [
    :channel_types,
    :custom_id,
    :disabled,
    :id,
    :max_values,
    :min_values,
    :placeholder,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_types: {:union, [[integer: "int32"], :null]},
      custom_id: :string,
      disabled: {:union, [:boolean, :null]},
      id: {:string, "snowflake"},
      max_values: {:union, [{:integer, "int32"}, :null]},
      min_values: {:union, [{:integer, "int32"}, :null]},
      placeholder: {:union, [:string, :null]},
      type: {:const, 8}
    ]
  end
end
