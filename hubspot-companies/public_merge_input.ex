defmodule PublicMergeInput do
  @moduledoc """
  Provides struct and type for a PublicMergeInput
  """

  @type t :: %__MODULE__{objectIdToMerge: String.t(), primaryObjectId: String.t()}

  defstruct [:objectIdToMerge, :primaryObjectId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [objectIdToMerge: {:string, :generic}, primaryObjectId: {:string, :generic}]
  end
end
