defmodule Klaviyo.SuppressionDeleteJobCreateQueryResourceObjectAttributesProfiles do
  @moduledoc """
  Provides struct and type for a SuppressionDeleteJobCreateQueryResourceObjectAttributesProfiles
  """

  @type t :: %__MODULE__{data: [Klaviyo.ProfileSuppressionDeleteQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.ProfileSuppressionDeleteQueryResourceObject, :t}]]
  end
end
