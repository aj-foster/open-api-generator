defmodule Affinda.DataPointChoiceCreate do
  @moduledoc """
  Provides struct and type for a DataPointChoiceCreate
  """

  @type t :: %__MODULE__{
          collection: String.t() | nil,
          dataPoint: String.t(),
          description: String.t() | nil,
          label: String.t(),
          organization: String.t() | nil,
          synonyms: [String.t()] | nil,
          value: String.t()
        }

  defstruct [:collection, :dataPoint, :description, :label, :organization, :synonyms, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collection: :string,
      dataPoint: :string,
      description: :string,
      label: :string,
      organization: :string,
      synonyms: [:string],
      value: :string
    ]
  end
end
