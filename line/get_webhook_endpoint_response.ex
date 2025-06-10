defmodule GetWebhookEndpointResponse do
  @moduledoc """
  Provides struct and type for a GetWebhookEndpointResponse
  """

  @type t :: %__MODULE__{active: boolean, endpoint: String.t()}

  defstruct [:active, :endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [active: :boolean, endpoint: {:string, :uri}]
  end
end
