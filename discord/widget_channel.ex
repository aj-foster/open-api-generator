defmodule Discord.WidgetChannel do
  @moduledoc """
  Provides struct and type for a WidgetChannel
  """

  @type t :: %__MODULE__{id: String.t(), name: String.t(), position: integer}

  defstruct [:id, :name, :position]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, "snowflake"}, name: :string, position: {:integer, "int32"}]
  end
end
