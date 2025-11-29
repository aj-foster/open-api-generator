defmodule OnboardingPromptResponse do
  @moduledoc """
  Provides struct and type for a OnboardingPromptResponse
  """

  @type t :: %__MODULE__{
          id: String.t(),
          in_onboarding: boolean,
          options: [OnboardingPromptOptionResponse.t()],
          required: boolean,
          single_select: boolean,
          title: String.t(),
          type: integer
        }

  defstruct [:id, :in_onboarding, :options, :required, :single_select, :title, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      in_onboarding: :boolean,
      options: [{OnboardingPromptOptionResponse, :t}],
      required: :boolean,
      single_select: :boolean,
      title: {:string, :generic},
      type: :integer
    ]
  end
end
