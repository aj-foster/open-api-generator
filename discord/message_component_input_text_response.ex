defmodule MessageComponentInputTextResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentInputTextResponse
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          id: String.t(),
          label: String.t() | nil,
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
      custom_id: {:string, :generic},
      id: {:string, "snowflake"},
      label: {:union, [{:string, :generic}, :null]},
      max_length: {:union, [{:integer, :int32}, :null]},
      min_length: {:union, [{:integer, :int32}, :null]},
      placeholder: {:union, [{:string, :generic}, :null]},
      required: {:union, [:boolean, :null]},
      style: {:integer, :int32},
      type: {:const, 4},
      value: {:union, [{:string, :generic}, :null]}
    ]
  end
end
