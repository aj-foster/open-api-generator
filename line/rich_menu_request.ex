defmodule Line.RichMenuRequest do
  @moduledoc """
  Provides struct and type for a RichMenuRequest
  """

  @type t :: %__MODULE__{
          areas: [Line.RichMenuArea.t()] | nil,
          chatBarText: String.t() | nil,
          name: String.t() | nil,
          selected: boolean | nil,
          size: Line.RichMenuSize.t() | nil
        }

  defstruct [:areas, :chatBarText, :name, :selected, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      areas: [{Line.RichMenuArea, :t}],
      chatBarText: :string,
      name: :string,
      selected: :boolean,
      size: {Line.RichMenuSize, :t}
    ]
  end
end
