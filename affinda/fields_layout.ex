defmodule FieldsLayout do
  @moduledoc """
  Provides struct and type for a FieldsLayout
  """

  @type t :: %__MODULE__{categories: [FieldCategory.t()], defaultCategory: FieldCategory.t()}

  defstruct [:categories, :defaultCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: [{FieldCategory, :t}], defaultCategory: {FieldCategory, :t}]
  end
end
