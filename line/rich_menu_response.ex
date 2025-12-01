defmodule Line.RichMenuResponse do
  @moduledoc """
  Provides struct and type for a RichMenuResponse
  """

  @type t :: %__MODULE__{
          areas: [Line.RichMenuArea.t()],
          chatBarText: String.t(),
          name: String.t(),
          richMenuId: String.t(),
          selected: boolean,
          size: Line.RichMenuSize.t()
        }

  defstruct [:areas, :chatBarText, :name, :richMenuId, :selected, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      areas: [{Line.RichMenuArea, :t}],
      chatBarText: :string,
      name: :string,
      richMenuId: :string,
      selected: :boolean,
      size: {Line.RichMenuSize, :t}
    ]
  end
end
