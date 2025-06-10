defmodule SearchOverrideInclude do
  @moduledoc """
  Provides struct and type for a SearchOverrideInclude
  """

  @type t :: %__MODULE__{id: String.t(), position: integer}

  defstruct [:id, :position]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, position: :integer]
  end
end
