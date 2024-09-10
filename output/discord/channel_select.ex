defmodule ChannelSelect do
  @moduledoc """
  Provides struct and type for a ChannelSelect
  """

  @type t :: %__MODULE__{
          channel_types: [integer] | nil,
          custom_id: String.t(),
          default_values: [map] | nil,
          disabled: boolean | nil,
          id: integer | nil,
          max_values: integer | nil,
          min_values: integer | nil,
          placeholder: String.t() | nil,
          type: 8
        }

  defstruct [
    :channel_types,
    :custom_id,
    :default_values,
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
      channel_types: {:union, [[:integer], :null]},
      custom_id: {:string, :generic},
      default_values: {:union, [[:map], :null]},
      disabled: {:union, [:boolean, :null]},
      id: {:union, [:integer, :null]},
      max_values: {:union, [:integer, :null]},
      min_values: {:union, [:integer, :null]},
      placeholder: {:union, [{:string, :generic}, :null]},
      type: {:const, 8}
    ]
  end
end
