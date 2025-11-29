defmodule CampaignMessageCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignMessageCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          channel: String.t(),
          content: EmailContentSubObject.t() | SMSContentSubObjectCreate.t() | nil,
          label: String.t() | nil,
          render_options: RenderOptionsSubObject.t() | nil
        }

  defstruct [:channel, :content, :label, :render_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel: {:string, :generic},
      content: {:union, [{EmailContentSubObject, :t}, {SMSContentSubObjectCreate, :t}]},
      label: {:string, :generic},
      render_options: {RenderOptionsSubObject, :t}
    ]
  end
end
