defmodule Affinda.DataFieldCreate do
  @moduledoc """
  Provides struct and type for a DataFieldCreate
  """

  @type t :: %__MODULE__{
          categoryLabel: String.t() | nil,
          dataPoint: Affinda.DataFieldCreateDataPoint.t(),
          field: Affinda.DataFieldCreateField.t()
        }

  defstruct [:categoryLabel, :dataPoint, :field]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categoryLabel: :string,
      dataPoint: {Affinda.DataFieldCreateDataPoint, :t},
      field: {Affinda.DataFieldCreateField, :t}
    ]
  end
end
