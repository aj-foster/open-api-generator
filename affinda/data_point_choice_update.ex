defmodule DataPointChoiceUpdate do
  @moduledoc """
  Provides struct and type for a DataPointChoiceUpdate
  """

  @type t :: %__MODULE__{
          collection: String.t() | nil,
          dataPoint: String.t() | nil,
          description: String.t() | nil,
          label: String.t() | nil,
          organization: String.t() | nil,
          synonyms: [String.t()] | nil,
          value: String.t() | nil
        }

  defstruct [:collection, :dataPoint, :description, :label, :organization, :synonyms, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collection: {:string, :generic},
      dataPoint: {:string, :generic},
      description: {:string, :generic},
      label: {:string, :generic},
      organization: {:string, :generic},
      synonyms: [string: :generic],
      value: {:string, :generic}
    ]
  end
end
