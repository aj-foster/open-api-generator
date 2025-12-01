defmodule OpenAI.ResponseCreatedEvent do
  @moduledoc """
  Provides struct and type for a ResponseCreatedEvent
  """

  @type t :: %__MODULE__{response: OpenAI.Response.t(), type: String.t()}

  defstruct [:response, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [response: {OpenAI.Response, :t}, type: {:const, "response.created"}]
  end
end
