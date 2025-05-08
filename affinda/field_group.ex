defmodule FieldGroup do
  @moduledoc """
  Provides struct and type for a FieldGroup
  """

  @type t :: %__MODULE__{fields: [FieldDeprecated.t()], label: String.t()}

  defstruct [:fields, :label]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fields: [{FieldDeprecated, :t}], label: {:string, :generic}]
  end
end
