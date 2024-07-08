defmodule PostTagGroupResponse do
  @moduledoc """
  Provides struct and type for a PostTagGroupResponse
  """

  @type t :: %__MODULE__{data: PostTagGroupResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostTagGroupResponseData, :t}]
  end
end
