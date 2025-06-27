defmodule RichMenuResponse do
  @moduledoc """
  Provides struct and type for a RichMenuResponse
  """

  @type t :: %__MODULE__{
          areas: [RichMenuArea.t()],
          chatBarText: String.t(),
          name: String.t(),
          richMenuId: String.t(),
          selected: boolean,
          size: RichMenuSize.t()
        }

  defstruct [:areas, :chatBarText, :name, :richMenuId, :selected, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      areas: [{RichMenuArea, :t}],
      chatBarText: {:string, :generic},
      name: {:string, :generic},
      richMenuId: {:string, :generic},
      selected: :boolean,
      size: {RichMenuSize, :t}
    ]
  end
end
