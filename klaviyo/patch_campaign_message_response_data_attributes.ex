defmodule Klaviyo.PatchCampaignMessageResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponseDataAttributes
  """

  @type t :: %__MODULE__{
          channel: String.t(),
          content: Klaviyo.EmailContentSubObject.t() | Klaviyo.SMSContentSubObject.t(),
          created_at: DateTime.t() | nil,
          label: String.t(),
          render_options: Klaviyo.RenderOptionsSubObject.t() | nil,
          send_times: [Klaviyo.SendTimeSubObject.t()] | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [:channel, :content, :created_at, :label, :render_options, :send_times, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel: :string,
      content: {:union, [{Klaviyo.EmailContentSubObject, :t}, {Klaviyo.SMSContentSubObject, :t}]},
      created_at: {:string, "date-time"},
      label: :string,
      render_options: {Klaviyo.RenderOptionsSubObject, :t},
      send_times: [{Klaviyo.SendTimeSubObject, :t}],
      updated_at: {:string, "date-time"}
    ]
  end
end
