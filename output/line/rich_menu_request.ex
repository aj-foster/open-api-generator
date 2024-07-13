defmodule RichMenuRequest do
  @moduledoc """
  Provides struct and type for a RichMenuRequest
  """

  @type t :: %__MODULE__{
          areas: [RichMenuArea.t()] | nil,
          chatBarText: String.t() | nil,
          name: String.t() | nil,
          selected: boolean | nil,
          size: RichMenuSize.t() | nil
        }

  defstruct [:areas, :chatBarText, :name, :selected, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      areas: [{RichMenuArea, :t}],
      chatBarText: {:string, :generic},
      name: {:string, :generic},
      selected: :boolean,
      size: {RichMenuSize, :t}
    ]
  end
end
