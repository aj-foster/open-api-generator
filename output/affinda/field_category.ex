defmodule FieldCategory do
  @moduledoc """
  Provides struct and type for a FieldCategory
  """

  @type t :: %__MODULE__{
          disabledFields: [Field.t()],
          enabledFields: [Field.t()],
          label: String.t()
        }

  defstruct [:disabledFields, :enabledFields, :label]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [disabledFields: [{Field, :t}], enabledFields: [{Field, :t}], label: {:string, :generic}]
  end
end
