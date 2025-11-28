defmodule ResumeDataWorkExperienceDates do
  @moduledoc """
  Provides struct and type for a ResumeDataWorkExperienceDates
  """

  @type t :: %__MODULE__{
          endDate: Date.t() | nil,
          isCurrent: boolean | nil,
          monthsInPosition: integer | nil,
          rawText: String.t() | nil,
          startDate: Date.t() | nil
        }

  defstruct [:endDate, :isCurrent, :monthsInPosition, :rawText, :startDate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      endDate: {:string, :date},
      isCurrent: :boolean,
      monthsInPosition: :integer,
      rawText: {:string, :generic},
      startDate: {:string, :date}
    ]
  end
end
