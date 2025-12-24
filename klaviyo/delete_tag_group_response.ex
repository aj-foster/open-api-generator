defmodule Klaviyo.DeleteTagGroupResponse do
  @moduledoc """
  Provides struct and type for a DeleteTagGroupResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.DeleteTagGroupResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.DeleteTagGroupResponseData, :t}]
  end
end
