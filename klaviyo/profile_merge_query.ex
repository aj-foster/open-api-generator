defmodule ProfileMergeQuery do
  @moduledoc """
  Provides struct and type for a ProfileMergeQuery
  """

  @type t :: %__MODULE__{data: ProfileMergeQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ProfileMergeQueryResourceObject, :t}]
  end
end
