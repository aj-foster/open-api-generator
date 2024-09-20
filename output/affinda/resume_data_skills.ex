defmodule ResumeDataSkills do
  @moduledoc """
  Provides struct and type for a ResumeDataSkills
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          emsiId: String.t() | nil,
          id: integer | nil,
          lastUsed: String.t() | nil,
          name: String.t() | nil,
          numberOfMonths: integer | nil,
          sources: [ResumeDataSkillsSources.t()] | nil,
          type: String.t() | nil,
          weighting: number | nil
        }

  defstruct [:count, :emsiId, :id, :lastUsed, :name, :numberOfMonths, :sources, :type, :weighting]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count: :integer,
      emsiId: {:string, :generic},
      id: :integer,
      lastUsed: {:string, :generic},
      name: {:string, :generic},
      numberOfMonths: :integer,
      sources: [{ResumeDataSkillsSources, :t}],
      type: {:string, :generic},
      weighting: :number
    ]
  end
end
