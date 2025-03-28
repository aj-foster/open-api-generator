defmodule BatchErrors do
  @moduledoc """
  Provides struct and type for a BatchErrors
  """

  @type t :: %__MODULE__{data: [BatchErrorsData.t()] | nil, object: String.t() | nil}

  defstruct [:data, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{BatchErrorsData, :t}], object: {:string, :generic}]
  end
end
