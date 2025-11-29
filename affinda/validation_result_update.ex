defmodule ValidationResultUpdate do
  @moduledoc """
  Provides struct and type for a ValidationResultUpdate
  """

  @type t :: %__MODULE__{
          annotations: [integer] | nil,
          document: String.t() | nil,
          message: String.t() | nil,
          passed: boolean | nil,
          ruleSlug: String.t() | nil
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
