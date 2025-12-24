defmodule Discord.ModalInteractionCallbackData do
  @moduledoc """
  Provides struct and type for a ModalInteractionCallbackData
  """

  @type t :: %__MODULE__{
          components: [Discord.ActionRow.t() | Discord.InputText.t()],
          custom_id: String.t(),
          title: String.t()
        }

  defstruct [:components, :custom_id, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      components: [union: [{Discord.ActionRow, :t}, {Discord.InputText, :t}]],
      custom_id: :string,
      title: :string
    ]
  end
end
