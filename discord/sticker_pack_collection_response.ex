defmodule StickerPackCollectionResponse do
  @moduledoc """
  Provides struct and type for a StickerPackCollectionResponse
  """

  @type t :: %__MODULE__{sticker_packs: [StickerPackResponse.t()]}

  defstruct [:sticker_packs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sticker_packs: [{StickerPackResponse, :t}]]
  end
end
