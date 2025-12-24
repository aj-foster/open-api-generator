defmodule Line.ErrorResponse do
  @moduledoc """
  Provides struct and type for a ErrorResponse
  """

  @type t :: %__MODULE__{
          details: [Line.ErrorDetail.t()] | nil,
          message: String.t(),
          sentMessages: [Line.SentMessage.t()] | nil
        }

  defstruct [:details, :message, :sentMessages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [details: [{Line.ErrorDetail, :t}], message: :string, sentMessages: [{Line.SentMessage, :t}]]
  end
end
