defmodule MessageCallResponse do
  @moduledoc """
  Provides struct and type for a MessageCallResponse
  """

  @type t :: %__MODULE__{ended_timestamp: DateTime.t() | nil, participants: [String.t()]}

  defstruct [:ended_timestamp, :participants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ended_timestamp: {:union, [{:string, :date_time}, :null]}, participants: [string: :generic]]
  end
end
