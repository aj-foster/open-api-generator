defmodule PatchTagGroupResponse do
  @moduledoc """
  Provides struct and type for a PatchTagGroupResponse
  """

  @type t :: %__MODULE__{data: PatchTagGroupResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchTagGroupResponseData, :t}]
  end
end
