defmodule Discord.IncomingWebhookRequestPartial do
  @moduledoc """
  Provides struct and type for a IncomingWebhookRequestPartial
  """

  @type t :: %__MODULE__{
          allowed_mentions: Discord.MessageAllowedMentionsRequest.t() | nil,
          applied_tags: [String.t()] | nil,
          attachments: [map] | nil,
          avatar_url: String.t() | nil,
          components: [Discord.ActionRow.t()] | nil,
          content: String.t() | nil,
          embeds: [map] | nil,
          flags: integer | nil,
          thread_name: String.t() | nil,
          tts: boolean | nil,
          username: String.t() | nil
        }

  defstruct [
    :allowed_mentions,
    :applied_tags,
    :attachments,
    :avatar_url,
    :components,
    :content,
    :embeds,
    :flags,
    :thread_name,
    :tts,
    :username
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowed_mentions: {:union, [{Discord.MessageAllowedMentionsRequest, :t}, :null]},
      applied_tags: {:union, [[string: "snowflake"], :null]},
      attachments: {:union, [[:map], :null]},
      avatar_url: {:union, [{:string, "uri"}, :null]},
      components: {:union, [[{Discord.ActionRow, :t}], :null]},
      content: {:union, [:string, :null]},
      embeds: {:union, [[:map], :null]},
      flags: {:union, [:integer, :null]},
      thread_name: {:union, [:string, :null]},
      tts: {:union, [:boolean, :null]},
      username: {:union, [:string, :null]}
    ]
  end
end
