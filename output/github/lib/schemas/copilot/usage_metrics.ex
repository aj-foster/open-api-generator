defmodule GitHub.Copilot.UsageMetrics do
  @moduledoc """
  Provides struct and type for a Copilot.UsageMetrics
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          breakdown: [map] | nil,
          day: Date.t(),
          total_acceptances_count: integer | nil,
          total_active_chat_users: integer | nil,
          total_active_users: integer | nil,
          total_chat_acceptances: integer | nil,
          total_chat_turns: integer | nil,
          total_lines_accepted: integer | nil,
          total_lines_suggested: integer | nil,
          total_suggestions_count: integer | nil
        }

  defstruct [
    :__info__,
    :breakdown,
    :day,
    :total_acceptances_count,
    :total_active_chat_users,
    :total_active_users,
    :total_chat_acceptances,
    :total_chat_turns,
    :total_lines_accepted,
    :total_lines_suggested,
    :total_suggestions_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      breakdown: {:union, [[:map], :null]},
      day: {:string, :date},
      total_acceptances_count: :integer,
      total_active_chat_users: :integer,
      total_active_users: :integer,
      total_chat_acceptances: :integer,
      total_chat_turns: :integer,
      total_lines_accepted: :integer,
      total_lines_suggested: :integer,
      total_suggestions_count: :integer
    ]
  end
end
