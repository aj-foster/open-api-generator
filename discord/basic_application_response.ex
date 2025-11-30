defmodule Discord.BasicApplicationResponse do
  @moduledoc """
  Provides struct and type for a BasicApplicationResponse
  """

  @type t :: %__MODULE__{
          bot: Discord.UserResponse.t() | nil,
          cover_image: String.t() | nil,
          description: String.t(),
          icon: String.t() | nil,
          id: String.t(),
          name: String.t(),
          primary_sku_id: String.t() | nil,
          type: integer | nil
        }

  defstruct [:bot, :cover_image, :description, :icon, :id, :name, :primary_sku_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bot: {:union, [{Discord.UserResponse, :t}, :null]},
      cover_image: {:union, [:string, :null]},
      description: :string,
      icon: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      name: :string,
      primary_sku_id: {:union, [{:string, "snowflake"}, :null]},
      type: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
