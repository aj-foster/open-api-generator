defmodule DataPointUpdate do
  @moduledoc """
  Provides struct and type for a DataPointUpdate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          mappingDataSource: String.t() | nil,
          name: String.t() | nil,
          parent: String.t() | nil,
          slug: String.t() | nil
        }

  defstruct [:description, :mappingDataSource, :name, :parent, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      mappingDataSource: {:string, :generic},
      name: {:string, :generic},
      parent: {:string, :generic},
      slug: {:string, :generic}
    ]
  end
end
