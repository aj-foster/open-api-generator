defmodule IncomingWebhookInteractionRequest do
  @moduledoc """
  Provides struct and type for a IncomingWebhookInteractionRequest
  """

  @type t :: %__MODULE__{
          allowed_mentions: MessageAllowedMentionsRequest.t() | nil,
          attachments: [map] | nil,
          components: [ActionRow.t()] | nil,
          content: String.t() | nil,
          embeds: [map] | nil,
          flags: integer | nil,
          tts: boolean | nil
        }

  defstruct [:allowed_mentions, :attachments, :components, :content, :embeds, :flags, :tts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowed_mentions: {:union, [{MessageAllowedMentionsRequest, :t}, :null]},
      attachments: {:union, [[:map], :null]},
      components: {:union, [[{ActionRow, :t}], :null]},
      content: {:union, [{:string, :generic}, :null]},
      embeds: {:union, [[:map], :null]},
      flags: {:union, [:integer, :null]},
      tts: {:union, [:boolean, :null]}
    ]
  end
end
