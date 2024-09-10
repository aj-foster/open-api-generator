defmodule DataPrivacyCreateDeletionJobQueryResourceObjectAttributesProfile do
  @moduledoc """
  Provides struct and type for a DataPrivacyCreateDeletionJobQueryResourceObjectAttributesProfile
  """

  @type t :: %__MODULE__{data: DataPrivacyProfileQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {DataPrivacyProfileQueryResourceObject, :t}]
  end
end
