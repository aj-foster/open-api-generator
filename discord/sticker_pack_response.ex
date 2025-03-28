defmodule StickerPackResponse do
  @moduledoc """
  Provides struct and type for a StickerPackResponse
  """

  @type t :: %__MODULE__{
          banner_asset_id: String.t() | nil,
          cover_sticker_id: String.t() | nil,
          description: String.t() | nil,
          id: String.t(),
          name: String.t(),
          sku_id: String.t(),
          stickers: [StandardStickerResponse.t()]
        }

  defstruct [:banner_asset_id, :cover_sticker_id, :description, :id, :name, :sku_id, :stickers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      banner_asset_id: {:union, [{:string, :generic}, :null]},
      cover_sticker_id: {:union, [{:string, :generic}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      sku_id: {:string, :generic},
      stickers: [{StandardStickerResponse, :t}]
    ]
  end
end
