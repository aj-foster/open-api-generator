defmodule PostProfileMergeResponse do
  @moduledoc """
  Provides struct and type for a PostProfileMergeResponse
  """

  @type t :: %__MODULE__{data: PostProfileMergeResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostProfileMergeResponseData, :t}]
  end
end
