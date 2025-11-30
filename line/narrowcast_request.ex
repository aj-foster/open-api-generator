defmodule Line.NarrowcastRequest do
  @moduledoc """
  Provides struct and type for a NarrowcastRequest
  """

  @type t :: %__MODULE__{
          filter: Line.Filter.t() | nil,
          limit: Line.Limit.t() | nil,
          messages: [Line.Message.t()],
          notificationDisabled: boolean | nil,
          recipient: Line.Recipient.t() | nil
        }

  defstruct [:filter, :limit, :messages, :notificationDisabled, :recipient]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filter: {Line.Filter, :t},
      limit: {Line.Limit, :t},
      messages: [{Line.Message, :t}],
      notificationDisabled: :boolean,
      recipient: {Line.Recipient, :t}
    ]
  end
end
