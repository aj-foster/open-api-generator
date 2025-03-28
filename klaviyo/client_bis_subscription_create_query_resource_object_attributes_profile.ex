defmodule ClientBISSubscriptionCreateQueryResourceObjectAttributesProfile do
  @moduledoc """
  Provides struct and type for a ClientBISSubscriptionCreateQueryResourceObjectAttributesProfile
  """

  @type t :: %__MODULE__{data: ProfileIdentifierDTOResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ProfileIdentifierDTOResourceObject, :t}]
  end
end
