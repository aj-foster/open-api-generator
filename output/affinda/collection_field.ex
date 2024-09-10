defmodule CollectionField do
  @moduledoc """
  Provides struct and type for a CollectionField
  """

  @type t :: %__MODULE__{
          autoValidationThreshold: number | nil,
          dataSource: String.t() | nil,
          displayEnumValue: boolean | nil,
          displayRawText: String.t() | nil,
          label: String.t() | nil,
          mandatory: boolean | nil,
          mapping: String.t() | nil,
          showDropdown: boolean | nil
        }

  defstruct [
    :autoValidationThreshold,
    :dataSource,
    :displayEnumValue,
    :displayRawText,
    :label,
    :mandatory,
    :mapping,
    :showDropdown
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      autoValidationThreshold: :number,
      dataSource: {:string, :generic},
      displayEnumValue: :boolean,
      displayRawText: {:string, :generic},
      label: {:string, :generic},
      mandatory: :boolean,
      mapping: {:string, :generic},
      showDropdown: :boolean
    ]
  end
end
