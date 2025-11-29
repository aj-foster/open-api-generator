defmodule MappingDataSourceCreate do
  @moduledoc """
  Provides struct and type for a MappingDataSourceCreate
  """

  @type t :: %__MODULE__{
          displayProperty: String.t() | nil,
          keyProperty: String.t() | nil,
          name: String.t() | nil,
          organization: String.t(),
          schema: map | nil,
          values: [map] | nil
        }

  defstruct [:displayProperty, :keyProperty, :name, :organization, :schema, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      displayProperty: {:string, :generic},
      keyProperty: {:string, :generic},
      name: {:string, :generic},
      organization: {:string, :generic},
      schema: :map,
      values: [:map]
    ]
  end
end
