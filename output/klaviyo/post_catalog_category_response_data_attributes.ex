defmodule PostCatalogCategoryResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryResponseDataAttributes
  """

  @type t :: %__MODULE__{
          external_id: String.t() | nil,
          name: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [:external_id, :name, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [external_id: {:string, :generic}, name: {:string, :generic}, updated: {:string, :date_time}]
  end
end
