defmodule Mapping do
  @moduledoc """
  Provides struct and type for a Mapping
  """

  @type t :: %__MODULE__{
          dataSource: String.t() | nil,
          identifier: String.t(),
          orderBy: String.t() | nil,
          organization: String.t() | nil,
          scoreCutoff: number | nil
        }

  defstruct [:dataSource, :identifier, :orderBy, :organization, :scoreCutoff]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dataSource: {:string, :generic},
      identifier: {:string, :generic},
      orderBy: {:string, :generic},
      organization: {:string, :generic},
      scoreCutoff: :number
    ]
  end
end
