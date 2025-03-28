defmodule OrganizationDetailsOnboardingTasks do
  @moduledoc """
  Provides struct and type for a OrganizationDetailsOnboardingTasks
  """

  @type t :: %__MODULE__{
          data: map | nil,
          dateCompleted: DateTime.t() | nil,
          status: String.t() | nil,
          task: integer | nil,
          user: String.t() | nil
        }

  defstruct [:data, :dateCompleted, :status, :task, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :map,
      dateCompleted: {:string, :date_time},
      status: {:string, :generic},
      task: :integer,
      user: {:string, :generic}
    ]
  end
end
