defmodule Affinda.ChangedValidationResults do
  @moduledoc """
  Provides struct and type for a ChangedValidationResults
  """

  @type t :: %__MODULE__{
          created: [Affinda.ValidationResult.t()] | nil,
          deleted: [Affinda.ValidationResult.t()] | nil,
          updated: [Affinda.ValidationResult.t()] | nil
        }

  defstruct [:created, :deleted, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: [{Affinda.ValidationResult, :t}],
      deleted: [{Affinda.ValidationResult, :t}],
      updated: [{Affinda.ValidationResult, :t}]
    ]
  end
end
