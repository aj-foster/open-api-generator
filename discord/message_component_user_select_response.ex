defmodule MessageComponentUserSelectResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentUserSelectResponse
  """

  @type t :: %__MODULE__{
          custom_id: String.t(),
          disabled: boolean | nil,
          id: String.t(),
          max_values: integer | nil,
          min_values: integer | nil,
          placeholder: String.t() | nil,
          type: 5
        }

  defstruct [:custom_id, :disabled, :id, :max_values, :min_values, :placeholder, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_id: {:string, :generic},
      disabled: {:union, [:boolean, :null]},
      id: {:string, :generic},
      max_values: {:union, [:integer, :null]},
      min_values: {:union, [:integer, :null]},
      placeholder: {:union, [{:string, :generic}, :null]},
      type: {:const, 5}
    ]
  end
end
