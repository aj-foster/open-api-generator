defmodule StringSelect do
  @moduledoc """
  Provides struct and type for a StringSelect
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          disabled: boolean | nil,
          id: integer | nil,
          max_values: integer | nil,
          min_values: integer | nil,
          options: [SelectOption.t()],
          placeholder: String.t() | nil,
          type: 3
        }

  defstruct [:custom_id, :disabled, :id, :max_values, :min_values, :options, :placeholder, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_id: {:string, :generic},
      disabled: {:union, [:boolean, :null]},
      id: {:union, [:integer, :null]},
      max_values: {:union, [:integer, :null]},
      min_values: {:union, [:integer, :null]},
      options: [{SelectOption, :t}],
      placeholder: {:union, [{:string, :generic}, :null]},
      type: {:const, 3}
    ]
  end
end
