defmodule RichMenuAliasListResponse do
  @moduledoc """
  Provides struct and type for a RichMenuAliasListResponse
  """

  @type t :: %__MODULE__{aliases: [RichMenuAliasResponse.t()]}

  defstruct [:aliases]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [aliases: [{RichMenuAliasResponse, :t}]]
  end
end
