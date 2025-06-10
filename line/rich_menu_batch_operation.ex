defmodule RichMenuBatchOperation do
  @moduledoc """
  Provides struct and type for a RichMenuBatchOperation
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:string, :generic}]
  end
end
