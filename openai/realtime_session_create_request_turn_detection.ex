defmodule OpenAI.RealtimeSessionCreateRequestTurnDetection do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateRequestTurnDetection
  """

  @type t :: %__MODULE__{
          create_response: boolean | nil,
          interrupt_response: boolean | nil,
          prefix_padding_ms: integer | nil,
          silence_duration_ms: integer | nil,
          threshold: number | nil,
          type: String.t() | nil
        }

  defstruct [
    :create_response,
    :interrupt_response,
    :prefix_padding_ms,
    :silence_duration_ms,
    :threshold,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      create_response: :boolean,
      interrupt_response: :boolean,
      prefix_padding_ms: :integer,
      silence_duration_ms: :integer,
      threshold: :number,
      type: :string
    ]
  end
end
