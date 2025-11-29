defmodule ProfileImportJobCreateQueryResourceObjectAttributesProfiles do
  @moduledoc """
  Provides struct and type for a ProfileImportJobCreateQueryResourceObjectAttributesProfiles
  """

  @type t :: %__MODULE__{data: [ProfileUpsertQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ProfileUpsertQueryResourceObject, :t}]]
  end
end
