defmodule DataPrivacyCreateDeletionJobQuery do
  @moduledoc """
  Provides struct and type for a DataPrivacyCreateDeletionJobQuery
  """

  @type t :: %__MODULE__{data: DataPrivacyCreateDeletionJobQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {DataPrivacyCreateDeletionJobQueryResourceObject, :t}]
  end
end
