defmodule SetWebhookEndpointRequest do
  @moduledoc """
  Provides struct and type for a SetWebhookEndpointRequest
  """

  @type t :: %__MODULE__{endpoint: String.t()}

  defstruct [:endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [endpoint: {:string, :uri}]
  end
end
