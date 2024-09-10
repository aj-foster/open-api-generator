defmodule CreateMessageInteractionCallbackRequest do
  @moduledoc """
  Provides struct and type for a CreateMessageInteractionCallbackRequest
  """

  @type t :: %__MODULE__{data: IncomingWebhookInteractionRequest.t() | nil, type: 4 | 5}

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {:union, [{IncomingWebhookInteractionRequest, :t}, :null]}, type: {:enum, [4, 5]}]
  end
end
