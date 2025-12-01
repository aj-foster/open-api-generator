defmodule Affinda.DataPointChoiceUpdate do
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
