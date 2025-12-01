defmodule OpenAI.FineTuningJobEvent do
  @moduledoc """
  Provides struct and type for a FineTuningJobEvent
  """

  @type t :: %__MODULE__{
          created_at: integer,
          data: map | nil,
          id: String.t(),
          level: String.t(),
          message: String.t(),
          object: String.t(),
          type: String.t() | nil
        }

  defstruct [:created_at, :data, :id, :level, :message, :object, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      data: :map,
      id: :string,
      level: {:enum, ["info", "warn", "error"]},
      message: :string,
      object: {:const, "fine_tuning.job.event"},
      type: {:enum, ["message", "metrics"]}
    ]
  end
end
