defmodule Klaviyo.CampaignMessagePartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignMessagePartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          content:
            Klaviyo.EmailContentSubObject.t() | Klaviyo.SMSContentSubObjectCreate.t() | nil,
          label: String.t() | nil,
          render_options: Klaviyo.RenderOptionsSubObject.t() | nil
        }

  defstruct [:content, :label, :render_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content:
        {:union, [{Klaviyo.EmailContentSubObject, :t}, {Klaviyo.SMSContentSubObjectCreate, :t}]},
      label: :string,
      render_options: {Klaviyo.RenderOptionsSubObject, :t}
    ]
  end
end
