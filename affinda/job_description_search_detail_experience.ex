defmodule JobDescriptionSearchDetailExperience do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailExperience
  """

  @type t :: %__MODULE__{
          match: boolean | nil,
          maximumExperience: integer | nil,
          minimumExperience: integer | nil
        }

  defstruct [:match, :maximumExperience, :minimumExperience]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [match: :boolean, maximumExperience: :integer, minimumExperience: :integer]
  end
end
