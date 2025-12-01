defmodule SpaceTraders.Chart do
  @moduledoc """
  Provides struct and type for a Chart
  """

  @type t :: %__MODULE__{
          submittedBy: String.t() | nil,
          submittedOn: DateTime.t() | nil,
          waypointSymbol: String.t() | nil
        }

  defstruct [:submittedBy, :submittedOn, :waypointSymbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [submittedBy: :string, submittedOn: {:string, "date-time"}, waypointSymbol: :string]
  end
end
