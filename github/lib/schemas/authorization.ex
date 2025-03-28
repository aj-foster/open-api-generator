defmodule GitHub.Authorization do
  @moduledoc """
  Provides struct and type for a Authorization
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          app: GitHub.AuthorizationApp.t(),
          created_at: DateTime.t(),
          expires_at: DateTime.t() | nil,
          fingerprint: String.t() | nil,
          hashed_token: String.t() | nil,
          id: integer,
          installation: GitHub.Installation.scoped() | nil,
          note: String.t() | nil,
          note_url: String.t() | nil,
          scopes: [String.t()] | nil,
          token: String.t(),
          token_last_eight: String.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple() | nil
        }

  defstruct [
    :__info__,
    :app,
    :created_at,
    :expires_at,
    :fingerprint,
    :hashed_token,
    :id,
    :installation,
    :note,
    :note_url,
    :scopes,
    :token,
    :token_last_eight,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app: {GitHub.AuthorizationApp, :t},
      created_at: {:string, :date_time},
      expires_at: {:union, [{:string, :date_time}, :null]},
      fingerprint: {:union, [{:string, :generic}, :null]},
      hashed_token: {:union, [{:string, :generic}, :null]},
      id: :integer,
      installation: {:union, [{GitHub.Installation, :scoped}, :null]},
      note: {:union, [{:string, :generic}, :null]},
      note_url: {:union, [{:string, :uri}, :null]},
      scopes: {:union, [[string: :generic], :null]},
      token: {:string, :generic},
      token_last_eight: {:union, [{:string, :generic}, :null]},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
