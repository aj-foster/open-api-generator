defmodule Discord.InputText do
  @moduledoc """
  Provides struct and type for a InputText
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          id: integer | nil,
          label: String.t(),
          max_length: integer | nil,
          min_length: integer | nil,
          placeholder: String.t() | nil,
          required: boolean | nil,
          style: integer,
          type: 4,
          value: String.t() | nil
        }

  defstruct [
    :custom_id,
    :id,
    :label,
    :max_length,
    :min_length,
    :placeholder,
    :required,
    :style,
    :type,
    :value
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_id: :string,
      id: {:union, [{:integer, "int64"}, :null]},
      label: :string,
      max_length: {:union, [:integer, :null]},
      min_length: {:union, [:integer, :null]},
      placeholder: {:union, [:string, :null]},
      required: {:union, [:boolean, :null]},
      style: {:integer, "int32"},
      type: {:const, 4},
      value: {:union, [:string, :null]}
    ]
  end
end
