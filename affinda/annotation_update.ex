defmodule Affinda.AnnotationUpdate do
  @moduledoc """
  Provides struct and type for a AnnotationUpdate
  """

  @type t :: %__MODULE__{
          dataPoint: String.t() | nil,
          document: String.t() | nil,
          isClientVerified: boolean | nil,
          pageIndex: integer | nil,
          parent: integer | nil,
          parsed:
            boolean | integer | map | number | String.t() | [Affinda.AnnotationCreate.t()] | nil,
          raw: String.t() | nil,
          rectangles: [Affinda.Rectangle.t()] | nil,
          validationResults: [Affinda.ChangedValidationResults.t()] | nil
        }

  defstruct [
    :dataPoint,
    :document,
    :isClientVerified,
    :pageIndex,
    :parent,
    :parsed,
    :raw,
    :rectangles,
    :validationResults
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dataPoint: :string,
      document: :string,
      isClientVerified: :boolean,
      pageIndex: :integer,
      parent: :integer,
      parsed:
        {:union, [:boolean, :integer, :map, :number, :string, [{Affinda.AnnotationCreate, :t}]]},
      raw: :string,
      rectangles: [{Affinda.Rectangle, :t}],
      validationResults: [{Affinda.ChangedValidationResults, :t}]
    ]
  end
end
