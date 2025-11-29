defmodule NarrowcastRequest do
  @moduledoc """
  Provides struct and type for a NarrowcastRequest
  """

  @type t :: %__MODULE__{
          filter: Filter.t() | nil,
          limit: Limit.t() | nil,
          messages: [Message.t()],
          notificationDisabled: boolean | nil,
          recipient: Recipient.t() | nil
        }

  defstruct [:filter, :limit, :messages, :notificationDisabled, :recipient]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filter: {Filter, :t},
      limit: {Limit, :t},
      messages: [{Message, :t}],
      notificationDisabled: :boolean,
      recipient: {Recipient, :t}
    ]
  end
end
