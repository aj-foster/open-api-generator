defmodule PushMessageRequest do
  @moduledoc """
  Provides struct and type for a PushMessageRequest
  """

  @type t :: %__MODULE__{
          customAggregationUnits: [String.t()] | nil,
          messages: [Message.t()],
          notificationDisabled: boolean | nil,
          to: String.t()
        }

  defstruct [:customAggregationUnits, :messages, :notificationDisabled, :to]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customAggregationUnits: [string: :generic],
      messages: [{Message, :t}],
      notificationDisabled: :boolean,
      to: {:string, :generic}
    ]
  end
end
