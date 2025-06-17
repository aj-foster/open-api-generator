defmodule ErrorResponse do
  @moduledoc """
  Provides struct and type for a ErrorResponse
  """

  @type t :: %__MODULE__{
          details: [ErrorDetail.t()] | nil,
          message: String.t(),
          sentMessages: [SentMessage.t()] | nil
        }

  defstruct [:details, :message, :sentMessages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      details: [{ErrorDetail, :t}],
      message: {:string, :generic},
      sentMessages: [{SentMessage, :t}]
    ]
  end
end
