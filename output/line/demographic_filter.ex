defmodule DemographicFilter do
  @moduledoc """
  Provides struct and type for a DemographicFilter
  """

  @type t :: %__MODULE__{type: String.t() | nil}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:string, :generic}]
  end
end
