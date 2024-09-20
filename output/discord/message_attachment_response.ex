defmodule MessageAttachmentResponse do
  @moduledoc """
  Provides struct and type for a MessageAttachmentResponse
  """

  @type t :: %__MODULE__{
          application: ApplicationResponse.t() | nil,
          clip_created_at: DateTime.t() | nil,
          clip_participants: [UserResponse.t()] | nil,
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
      application: {:union, [{ApplicationResponse, :t}, :null]},
      clip_created_at: {:union, [{:string, :date_time}, :null]},
      clip_participants: {:union, [[{UserResponse, :t}], :null]},
      content_type: {:union, [{:string, :generic}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      duration_secs: {:union, [:number, :null]},
      ephemeral: {:union, [:boolean, :null]},
      filename: {:string, :generic},
      height: {:union, [:integer, :null]},
      id: {:string, :generic},
      proxy_url: {:string, :uri},
      size: :integer,
      title: {:union, [{:string, :generic}, :null]},
      url: {:string, :uri},
      waveform: {:union, [{:string, :generic}, :null]},
      width: {:union, [:integer, :null]}
    ]
  end
end
