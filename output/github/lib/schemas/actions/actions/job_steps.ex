defmodule GitHub.Actions.Actions.JobSteps do
  @moduledoc """
  Provides struct and type for a Actions.Actions.JobSteps
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          completed_at: DateTime.t() | nil,
          conclusion: String.t() | nil,
          name: String.t(),
          number: integer,
          started_at: DateTime.t() | nil,
          status: String.t()
        }

  defstruct [:__info__, :completed_at, :conclusion, :name, :number, :started_at, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:union, [{:string, :date_time}, :null]},
      conclusion: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      number: :integer,
      started_at: {:union, [{:string, :date_time}, :null]},
      status: {:enum, ["queued", "in_progress", "completed"]}
    ]
  end
end
