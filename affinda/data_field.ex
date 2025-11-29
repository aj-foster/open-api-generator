defmodule DataField do
  @moduledoc """
  Provides struct and type for a DataField
  """

  @type t :: %__MODULE__{
          categoryLabel: String.t() | nil,
          dataPoint: DataFieldDataPoint.t(),
          field: DataFieldField.t()
        }

  defstruct [:categoryLabel, :dataPoint, :field]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categoryLabel: {:string, :generic},
      dataPoint: {DataFieldDataPoint, :t},
      field: {DataFieldField, :t}
    ]
  end
end
