defmodule DeleteTagGroupResponse do
  @moduledoc """
  Provides struct and type for a DeleteTagGroupResponse
  """

  @type t :: %__MODULE__{data: DeleteTagGroupResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {DeleteTagGroupResponseData, :t}]
  end
end
