defmodule StandardStickerResponse do
  @moduledoc """
  Provides struct and type for a StandardStickerResponse
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          format_type: integer | nil,
          id: String.t(),
          name: String.t(),
          pack_id: String.t(),
          sort_value: integer,
          tags: String.t(),
          type: 1
        }

  defstruct [:description, :format_type, :id, :name, :pack_id, :sort_value, :tags, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      format_type: {:union, [:integer, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      pack_id: {:string, :generic},
      sort_value: :integer,
      tags: {:string, :generic},
      type: {:const, 1}
    ]
  end
end
