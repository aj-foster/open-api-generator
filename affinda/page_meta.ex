defmodule PageMeta do
  @moduledoc """
  Provides struct and type for a PageMeta
  """

  @type t :: %__MODULE__{
          height: number,
          id: integer,
          image: String.t() | nil,
          imageTranslated: String.t() | nil,
          pageIndex: integer,
          rotation: integer,
          width: number
        }

  defstruct [:height, :id, :image, :imageTranslated, :pageIndex, :rotation, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      height: :number,
      id: :integer,
      image: {:string, :generic},
      imageTranslated: {:string, :generic},
      pageIndex: :integer,
      rotation: :integer,
      width: :number
    ]
  end
end
