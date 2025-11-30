defmodule Discord.MessageAttachmentResponse do
  @moduledoc """
  Provides struct and type for a MessageAttachmentResponse
  """

  @type t :: %__MODULE__{
          application: Discord.ApplicationResponse.t() | nil,
          clip_created_at: DateTime.t() | nil,
          clip_participants: [Discord.UserResponse.t()] | nil,
          content_type: String.t() | nil,
          description: String.t() | nil,
          duration_secs: number | nil,
          ephemeral: boolean | nil,
          filename: String.t(),
          height: integer | nil,
          id: String.t(),
          proxy_url: String.t(),
          size: integer,
          title: String.t() | nil,
          url: String.t(),
          waveform: String.t() | nil,
          width: integer | nil
        }

  defstruct [
    :application,
    :clip_created_at,
    :clip_participants,
    :content_type,
    :description,
    :duration_secs,
    :ephemeral,
    :filename,
    :height,
    :id,
    :proxy_url,
    :size,
    :title,
    :url,
    :waveform,
    :width
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application: {:union, [{Discord.ApplicationResponse, :t}, :null]},
      clip_created_at: {:union, [{:string, "date-time"}, :null]},
      clip_participants: {:union, [[{Discord.UserResponse, :t}], :null]},
      content_type: {:union, [:string, :null]},
      description: {:union, [:string, :null]},
      duration_secs: {:union, [{:number, "double"}, :null]},
      ephemeral: {:union, [:boolean, :null]},
      filename: :string,
      height: {:union, [{:integer, "int32"}, :null]},
      id: {:string, "snowflake"},
      proxy_url: {:string, "uri"},
      size: {:integer, "int32"},
      title: {:union, [:string, :null]},
      url: {:string, "uri"},
      waveform: {:union, [:string, :null]},
      width: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
