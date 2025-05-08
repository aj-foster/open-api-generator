defmodule JobDescriptionSearchDetailSkillsValue do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailSkillsValue
  """

  @type t :: %__MODULE__{match: boolean | nil, name: String.t() | nil}

  defstruct [:match, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [match: :boolean, name: {:string, :generic}]
  end
end
