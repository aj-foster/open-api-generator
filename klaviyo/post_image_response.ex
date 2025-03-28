defmodule PostImageResponse do
  @moduledoc """
  Provides struct and type for a PostImageResponse
  """

  @type t :: %__MODULE__{data: PostImageResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostImageResponseData, :t}]
  end
end
