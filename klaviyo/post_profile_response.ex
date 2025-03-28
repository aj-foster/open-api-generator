defmodule PostProfileResponse do
  @moduledoc """
  Provides struct and type for a PostProfileResponse
  """

  @type t :: %__MODULE__{data: PostProfileResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostProfileResponseData, :t}]
  end
end
