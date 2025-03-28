defmodule PostCampaignMessageResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponseDataAttributes
  """

  @type t :: %__MODULE__{
          channel: String.t(),
          content: EmailContentSubObject.t() | SMSContentSubObject.t(),
          created_at: DateTime.t() | nil,
          label: String.t(),
          render_options: RenderOptionsSubObject.t() | nil,
          send_times: [SendTimeSubObject.t()] | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [:channel, :content, :created_at, :label, :render_options, :send_times, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel: {:string, :generic},
      content: {:union, [{EmailContentSubObject, :t}, {SMSContentSubObject, :t}]},
      created_at: {:string, :date_time},
      label: {:string, :generic},
      render_options: {RenderOptionsSubObject, :t},
      send_times: [{SendTimeSubObject, :t}],
      updated_at: {:string, :date_time}
    ]
  end
end
