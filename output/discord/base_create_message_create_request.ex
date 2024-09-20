defmodule BaseCreateMessageCreateRequest do
  @moduledoc """
  Provides struct and type for a BaseCreateMessageCreateRequest
  """

  @type t :: %__MODULE__{
          allowed_mentions: MessageAllowedMentionsRequest.t() | nil,
          attachments: [map] | nil,
          components: [ActionRow.t()] | nil,
          content: String.t() | nil,
          embeds: [map] | nil,
          flags: integer | nil,
          sticker_ids: [String.t()] | nil
        }

  defstruct [
    :allowed_mentions,
    :attachments,
    :components,
    :content,
    :embeds,
    :flags,
    :sticker_ids
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
      sticker_ids: {:union, [[string: :generic], :null]}
    ]
  end
end
