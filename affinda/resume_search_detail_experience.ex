defmodule ResumeSearchDetailExperience do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailExperience
  """

  @type t :: %__MODULE__{match: boolean | nil, years: integer | nil}

  defstruct [:match, :years]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [match: :boolean, years: :integer]
  end
end
