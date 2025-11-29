defmodule PostListCreateResponse do
  @moduledoc """
  Provides struct and type for a PostListCreateResponse
  """

  @type t :: %__MODULE__{data: PostListCreateResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostListCreateResponseData, :t}]
  end
end
