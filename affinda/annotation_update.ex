defmodule AnnotationUpdate do
  @moduledoc """
  Provides struct and type for a AnnotationUpdate
  """

  @type t :: %__MODULE__{
          dataPoint: String.t() | nil,
          document: String.t() | nil,
          isClientVerified: boolean | nil,
          pageIndex: integer | nil,
          parent: integer | nil,
          parsed: boolean | integer | map | number | String.t() | [AnnotationCreate.t()] | nil,
          raw: String.t() | nil,
          rectangles: [Rectangle.t()] | nil,
          validationResults: [ChangedValidationResults.t()] | nil
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
      dataPoint: {:string, :generic},
      document: {:string, :generic},
      isClientVerified: :boolean,
      pageIndex: :integer,
      parent: :integer,
      parsed:
        {:union,
         [:boolean, :integer, :map, :number, {:string, :generic}, [{AnnotationCreate, :t}]]},
      raw: {:string, :generic},
      rectangles: [{Rectangle, :t}],
      validationResults: [{ChangedValidationResults, :t}]
    ]
  end
end
