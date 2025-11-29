defmodule CampaignMessagePartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignMessagePartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          content: EmailContentSubObject.t() | SMSContentSubObjectCreate.t() | nil,
          label: String.t() | nil,
          render_options: RenderOptionsSubObject.t() | nil
        }

  defstruct [:content, :label, :render_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:union, [{EmailContentSubObject, :t}, {SMSContentSubObjectCreate, :t}]},
      label: {:string, :generic},
      render_options: {RenderOptionsSubObject, :t}
    ]
  end
end
