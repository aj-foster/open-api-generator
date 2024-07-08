defmodule RelationshipLinks do
  @moduledoc """
  Provides struct and type for a RelationshipLinks
  """

  @type t :: %__MODULE__{related: String.t(), self: String.t()}

  defstruct [:related, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [related: {:string, :uri}, self: {:string, :uri}]
  end
end
