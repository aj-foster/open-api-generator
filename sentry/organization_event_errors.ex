defmodule OrganizationEventErrors do
  @moduledoc """
  Provides struct and type for a OrganizationEventErrors
  """

  @type t :: %__MODULE__{data: map | nil, message: String.t() | nil, type: String.t() | nil}

  defstruct [:data, :message, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: :map, message: {:string, :generic}, type: {:string, :generic}]
  end
end
