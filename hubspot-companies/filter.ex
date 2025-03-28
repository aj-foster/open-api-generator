defmodule Filter do
  @moduledoc """
  Provides struct and type for a Filter
  """

  @type t :: %__MODULE__{
          highValue: String.t() | nil,
          operator: String.t(),
          propertyName: String.t(),
          value: String.t() | nil,
          values: [String.t()] | nil
        }

  defstruct [:highValue, :operator, :propertyName, :value, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      highValue: {:string, :generic},
      operator:
        {:enum,
         [
           "EQ",
           "NEQ",
           "LT",
           "LTE",
           "GT",
           "GTE",
           "BETWEEN",
           "IN",
           "NOT_IN",
           "HAS_PROPERTY",
           "NOT_HAS_PROPERTY",
           "CONTAINS_TOKEN",
           "NOT_CONTAINS_TOKEN"
         ]},
      propertyName: {:string, :generic},
      value: {:string, :generic},
      values: [string: :generic]
    ]
  end
end
