defmodule ChangedValidationResults do
  @moduledoc """
  Provides struct and type for a ChangedValidationResults
  """

  @type t :: %__MODULE__{
          created: [ValidationResult.t()] | nil,
          deleted: [ValidationResult.t()] | nil,
          updated: [ValidationResult.t()] | nil
        }

  defstruct [:created, :deleted, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: [{ValidationResult, :t}],
      deleted: [{ValidationResult, :t}],
      updated: [{ValidationResult, :t}]
    ]
  end
end
