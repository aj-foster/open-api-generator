defmodule ValidationResult do
  @moduledoc """
  Provides struct and type for a ValidationResult
  """

  @type t :: %__MODULE__{
          annotations: [integer],
          document: String.t(),
          id: integer,
          message: String.t(),
          passed: boolean,
          ruleSlug: String.t()
        }

  defstruct [:annotations, :document, :id, :message, :passed, :ruleSlug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [:integer],
      document: {:string, :generic},
      id: :integer,
      message: {:string, :generic},
      passed: :boolean,
      ruleSlug: {:string, :generic}
    ]
  end
end
