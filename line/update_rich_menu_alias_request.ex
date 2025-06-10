defmodule UpdateRichMenuAliasRequest do
  @moduledoc """
  Provides struct and type for a UpdateRichMenuAliasRequest
  """

  @type t :: %__MODULE__{richMenuId: String.t()}

  defstruct [:richMenuId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [richMenuId: {:string, :generic}]
  end
end
