defmodule PostTagResponse do
  @moduledoc """
  Provides struct and type for a PostTagResponse
  """

  @type t :: %__MODULE__{data: PostTagResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostTagResponseData, :t}]
  end
end
