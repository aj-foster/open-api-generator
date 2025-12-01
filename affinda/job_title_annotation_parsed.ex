defmodule Affinda.JobTitleAnnotationParsed do
  @moduledoc """
  Provides struct and type for a JobTitleAnnotationParsed
  """

  @type t :: %__MODULE__{
          classification: Affinda.JobTitleAnnotationParsedClassification.t() | nil,
          managementLevel: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:classification, :managementLevel, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      classification: {Affinda.JobTitleAnnotationParsedClassification, :t},
      managementLevel: :string,
      name: :string
    ]
  end
end
