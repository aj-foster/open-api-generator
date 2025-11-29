defmodule RichMenuListResponse do
  @moduledoc """
  Provides struct and type for a RichMenuListResponse
  """

  @type t :: %__MODULE__{richmenus: [RichMenuResponse.t()]}

  defstruct [:richmenus]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [richmenus: [{RichMenuResponse, :t}]]
  end
end
