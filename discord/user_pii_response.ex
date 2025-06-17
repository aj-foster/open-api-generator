defmodule UserPIIResponse do
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
      accent_color: {:union, [:integer, :null]},
      avatar: {:union, [{:string, :generic}, :null]},
      banner: {:union, [{:string, :generic}, :null]},
      bot: {:union, [:boolean, :null]},
      discriminator: {:string, :generic},
      email: {:union, [{:string, :generic}, :null]},
      flags: :integer,
      global_name: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      locale: {:string, :generic},
      mfa_enabled: :boolean,
      premium_type: {:union, [:integer, :null]},
      public_flags: :integer,
      system: {:union, [:boolean, :null]},
      username: {:string, :generic},
      verified: {:union, [:boolean, :null]}
    ]
  end
end
