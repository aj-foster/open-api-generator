defmodule Discord.StandardStickerResponse do
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
      description: {:union, [:string, :null]},
      format_type: {:union, [{:integer, "int32"}, :null]},
      id: {:string, "snowflake"},
      name: :string,
      pack_id: {:string, "snowflake"},
      sort_value: {:integer, "int32"},
      tags: :string,
      type: {:const, 1}
    ]
  end
end
