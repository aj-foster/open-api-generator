defmodule DataPointChoiceForReplace do
  @moduledoc """
  Provides struct and type for a DataPointChoiceForReplace
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          label: String.t() | nil,
          synonyms: [String.t()] | nil,
          value: String.t()
        }

  defstruct [:description, :label, :synonyms, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      label: {:string, :generic},
      synonyms: [string: :generic],
      value: {:string, :generic}
    ]
  end
end
