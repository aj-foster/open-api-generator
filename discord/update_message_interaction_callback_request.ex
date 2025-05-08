defmodule UpdateMessageInteractionCallbackRequest do
  @moduledoc """
  Provides struct and type for a UpdateMessageInteractionCallbackRequest
  """

  @type t :: %__MODULE__{
          data: IncomingWebhookUpdateForInteractionCallbackRequestPartial.t() | nil,
          type: 6 | 7
        }

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {:union, [{IncomingWebhookUpdateForInteractionCallbackRequestPartial, :t}, :null]},
      type: {:enum, [6, 7]}
    ]
  end
end
