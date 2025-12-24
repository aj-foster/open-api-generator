defmodule GitHub.Copilot.SeatBreakdown do
  @moduledoc """
  Provides struct and type for a Copilot.SeatBreakdown
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          active_this_cycle: integer | nil,
          added_this_cycle: integer | nil,
          inactive_this_cycle: integer | nil,
          pending_cancellation: integer | nil,
          pending_invitation: integer | nil,
          total: integer | nil
        }

  defstruct [
    :__info__,
    :active_this_cycle,
    :added_this_cycle,
    :inactive_this_cycle,
    :pending_cancellation,
    :pending_invitation,
    :total
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_this_cycle: :integer,
      added_this_cycle: :integer,
      inactive_this_cycle: :integer,
      pending_cancellation: :integer,
      pending_invitation: :integer,
      total: :integer
    ]
  end
end
