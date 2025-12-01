defmodule Affinda.MappingCreate do
  @moduledoc """
  Provides struct and type for a MappingCreate
  """

  @type t :: %__MODULE__{
          dataSource: String.t() | nil,
          orderBy: String.t() | nil,
          organization: String.t() | nil,
          scoreCutoff: number | nil
        }

  defstruct [:dataSource, :orderBy, :organization, :scoreCutoff]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dataSource: :string, orderBy: :string, organization: :string, scoreCutoff: :number]
  end
end
