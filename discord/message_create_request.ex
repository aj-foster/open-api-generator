defmodule MessageCreateRequest do
  @moduledoc """
  Provides struct and type for a MessageCreateRequest
  """

  @type t :: %__MODULE__{
          allowed_mentions: MessageAllowedMentionsRequest.t() | nil,
          attachments: [map] | nil,
          components: [ActionRow.t()] | nil,
          content: String.t() | nil,
          embeds: [map] | nil,
          flags: integer | nil,
          message_reference: MessageReferenceRequest.t() | nil,
          nonce: integer | String.t() | nil,
          sticker_ids: [String.t()] | nil,
          tts: boolean | nil
        }

  defstruct [
    :allowed_mentions,
    :attachments,
    :components,
    :content,
    :embeds,
    :flags,
    :message_reference,
    :nonce,
    :sticker_ids,
    :tts
  ]

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
      message_reference: {:union, [{MessageReferenceRequest, :t}, :null]},
      nonce: {:union, [:integer, {:string, :generic}, :null]},
      sticker_ids: {:union, [[string: :generic], :null]},
      tts: {:union, [:boolean, :null]}
    ]
  end
end
