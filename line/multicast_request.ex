defmodule Line.MulticastRequest do
  @moduledoc """
  Provides struct and type for a MulticastRequest
  """

  @type t :: %__MODULE__{
          customAggregationUnits: [String.t()] | nil,
          messages: [Line.Message.t()],
          notificationDisabled: boolean | nil,
          to: [String.t()]
        }

  defstruct [:customAggregationUnits, :messages, :notificationDisabled, :to]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customAggregationUnits: [:string],
      messages: [{Line.Message, :t}],
      notificationDisabled: :boolean,
      to: [:string]
    ]
  end
end
