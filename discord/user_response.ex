defmodule Discord.UserResponse do
  @moduledoc """
  Provides struct and type for a UserResponse
  """

  @type t :: %__MODULE__{
          accent_color: integer | nil,
          avatar: String.t() | nil,
          banner: String.t() | nil,
          bot: boolean | nil,
          discriminator: String.t(),
          flags: integer,
          global_name: String.t() | nil,
          id: String.t(),
          public_flags: integer,
          system: boolean | nil,
          username: String.t()
        }

  defstruct [
    :accent_color,
    :avatar,
    :banner,
    :bot,
    :discriminator,
    :flags,
    :global_name,
    :id,
    :public_flags,
    :system,
    :username
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accent_color: {:union, [{:integer, "int32"}, :null]},
      avatar: {:union, [:string, :null]},
      banner: {:union, [:string, :null]},
      bot: {:union, [:boolean, :null]},
      discriminator: :string,
      flags: {:integer, "int64"},
      global_name: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      public_flags: {:integer, "int32"},
      system: {:union, [:boolean, :null]},
      username: :string
    ]
  end
end
