defmodule ProfileImportJobCreateQuery do
  @moduledoc """
  Provides struct and type for a ProfileImportJobCreateQuery
  """

  @type t :: %__MODULE__{data: ProfileImportJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ProfileImportJobCreateQueryResourceObject, :t}]
  end
end
