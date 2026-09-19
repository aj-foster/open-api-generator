defmodule Affinda.FieldsLayout do
  @moduledoc """
  Provides struct and type for a FieldsLayout
  """

  @type t :: %__MODULE__{
          categories: [Affinda.FieldCategory.t()],
          defaultCategory: Affinda.FieldCategory.t()
        }

  defstruct [:categories, :defaultCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: [{Affinda.FieldCategory, :t}], defaultCategory: {Affinda.FieldCategory, :t}]
  end
end
