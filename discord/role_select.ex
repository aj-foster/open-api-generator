defmodule RoleSelect do
  @moduledoc """
  Provides struct and type for a RoleSelect
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          default_values: [map] | nil,
          disabled: boolean | nil,
          id: integer | nil,
          max_values: integer | nil,
          min_values: integer | nil,
          placeholder: String.t() | nil,
          type: 6
        }

  defstruct [
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
      custom_id: {:string, :generic},
      default_values: {:union, [[:map], :null]},
      disabled: {:union, [:boolean, :null]},
      id: {:union, [:integer, :null]},
      max_values: {:union, [:integer, :null]},
      min_values: {:union, [:integer, :null]},
      placeholder: {:union, [{:string, :generic}, :null]},
      type: {:const, 6}
    ]
  end
end
