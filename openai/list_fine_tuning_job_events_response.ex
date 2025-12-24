defmodule OpenAI.ListFineTuningJobEventsResponse do
  @moduledoc """
  Provides struct and type for a ListFineTuningJobEventsResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAI.FineTuningJobEvent.t()],
          has_more: boolean,
          object: String.t()
        }

  defstruct [:data, :has_more, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{OpenAI.FineTuningJobEvent, :t}], has_more: :boolean, object: {:const, "list"}]
  end
end
