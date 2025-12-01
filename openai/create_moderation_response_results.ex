defmodule OpenAI.CreateModerationResponseResults do
  @moduledoc """
  Provides struct and type for a CreateModerationResponseResults
  """

  @type t :: %__MODULE__{
          categories: OpenAI.CreateModerationResponseResultsCategories.t(),
          category_applied_input_types:
            OpenAI.CreateModerationResponseResultsCategoryAppliedInputTypes.t(),
          category_scores: OpenAI.CreateModerationResponseResultsCategoryScores.t(),
          flagged: boolean
        }

  defstruct [:categories, :category_applied_input_types, :category_scores, :flagged]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories: {OpenAI.CreateModerationResponseResultsCategories, :t},
      category_applied_input_types:
        {OpenAI.CreateModerationResponseResultsCategoryAppliedInputTypes, :t},
      category_scores: {OpenAI.CreateModerationResponseResultsCategoryScores, :t},
      flagged: :boolean
    ]
  end
end
