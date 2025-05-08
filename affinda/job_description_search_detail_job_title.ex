defmodule JobDescriptionSearchDetailJobTitle do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailJobTitle
  """

  @type t :: %__MODULE__{
          missing: [String.t()] | nil,
          value: JobDescriptionSearchDetailJobTitleValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [missing: [string: :generic], value: {JobDescriptionSearchDetailJobTitleValue, :t}]
  end
end
