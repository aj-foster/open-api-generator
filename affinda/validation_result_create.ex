defmodule ValidationResultCreate do
  @moduledoc """
  Provides struct and type for a ValidationResultCreate
  """

  @type t :: %__MODULE__{
          annotations: [integer],
          document: String.t(),
          message: String.t(),
          passed: boolean | nil,
          ruleSlug: String.t()
        }

  defstruct [:annotations, :document, :message, :passed, :ruleSlug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [:integer],
      document: {:string, :generic},
      message: {:string, :generic},
      passed: :boolean,
      ruleSlug: {:string, :generic}
    ]
  end
end
