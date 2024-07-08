defmodule DataPointChoice do
  @moduledoc """
  Provides struct and type for a DataPointChoice
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: integer,
          label: String.t(),
          synonyms: [String.t()] | nil,
          value: String.t()
        }

  defstruct [:description, :id, :label, :synonyms, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      id: :integer,
      label: {:string, :generic},
      synonyms: [string: :generic],
      value: {:string, :generic}
    ]
  end
end
