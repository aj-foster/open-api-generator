defmodule MappingDataSource do
  @moduledoc """
  Provides struct and type for a MappingDataSource
  """

  @type t :: %__MODULE__{
          displayProperty: String.t(),
          identifier: String.t(),
          keyProperty: String.t(),
          name: String.t() | nil,
          organization: String.t() | nil,
          schema: map | nil
        }

  defstruct [:displayProperty, :identifier, :keyProperty, :name, :organization, :schema]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      displayProperty: {:string, :generic},
      identifier: {:string, :generic},
      keyProperty: {:string, :generic},
      name: {:string, :generic},
      organization: {:string, :generic},
      schema: :map
    ]
  end
end
