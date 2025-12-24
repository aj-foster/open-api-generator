defmodule Klaviyo.PostProfileMergeResponse do
  @moduledoc """
  Provides struct and type for a PostProfileMergeResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostProfileMergeResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostProfileMergeResponseData, :t}]
  end
end
