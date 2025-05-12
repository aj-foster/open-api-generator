defmodule CatalogCategoryCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          catalog_type: String.t() | nil,
          external_id: String.t(),
          integration_type: String.t() | nil,
          name: String.t()
        }

  defstruct [:catalog_type, :external_id, :integration_type, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      catalog_type: {:string, :generic},
      external_id: {:string, :generic},
      integration_type: {:const, "$custom"},
      name: {:string, :generic}
    ]
  end
end
