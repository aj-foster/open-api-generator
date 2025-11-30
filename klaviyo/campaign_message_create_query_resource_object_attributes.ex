defmodule Klaviyo.CampaignMessageCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignMessageCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          channel: String.t(),
          content:
            Klaviyo.EmailContentSubObject.t() | Klaviyo.SMSContentSubObjectCreate.t() | nil,
          label: String.t() | nil,
          render_options: Klaviyo.RenderOptionsSubObject.t() | nil
        }

  defstruct [:channel, :content, :label, :render_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel: :string,
      content:
        {:union, [{Klaviyo.EmailContentSubObject, :t}, {Klaviyo.SMSContentSubObjectCreate, :t}]},
      label: :string,
      render_options: {Klaviyo.RenderOptionsSubObject, :t}
    ]
  end
end
