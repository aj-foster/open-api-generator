defmodule JobTitleAnnotationParsed do
  @moduledoc """
  Provides struct and type for a JobTitleAnnotationParsed
  """

  @type t :: %__MODULE__{
          classification: JobTitleAnnotationParsedClassification.t() | nil,
          managementLevel: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:classification, :managementLevel, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      classification: {JobTitleAnnotationParsedClassification, :t},
      managementLevel: {:string, :generic},
      name: {:string, :generic}
    ]
  end
end
