defmodule Discord.UserPIIResponse do
  @moduledoc """
  Provides struct and type for a UserPIIResponse
  """

  @type t :: %__MODULE__{
          accent_color: integer | nil,
          avatar: String.t() | nil,
          banner: String.t() | nil,
          bot: boolean | nil,
          discriminator: String.t(),
          email: String.t() | nil,
          flags: integer,
          global_name: String.t() | nil,
          id: String.t(),
          locale: String.t(),
          mfa_enabled: boolean,
          premium_type: integer | nil,
          public_flags: integer,
          system: boolean | nil,
          username: String.t(),
          verified: boolean | nil
        }

  defstruct [
    :accent_color,
    :avatar,
    :banner,
    :bot,
    :discriminator,
    :email,
    :flags,
    :global_name,
    :id,
    :locale,
    :mfa_enabled,
    :premium_type,
    :public_flags,
    :system,
    :username,
    :verified
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
      email: {:union, [:string, :null]},
      flags: {:integer, "int64"},
      global_name: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      locale: :string,
      mfa_enabled: :boolean,
      premium_type: {:union, [{:integer, "int32"}, :null]},
      public_flags: {:integer, "int32"},
      system: {:union, [:boolean, :null]},
      username: :string,
      verified: {:union, [:boolean, :null]}
    ]
  end
end
