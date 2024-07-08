defmodule GitHub.App do
  @moduledoc """
  Provides struct and type for a App
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          client_id: String.t() | nil,
          client_secret: String.t() | nil,
          created_at: DateTime.t(),
          description: String.t() | nil,
          events: [String.t()],
          external_url: String.t(),
          html_url: String.t(),
          id: integer,
          installations_count: integer | nil,
          name: String.t(),
          node_id: String.t(),
          owner: GitHub.User.simple() | nil,
          pem: String.t() | nil,
          permissions: map,
          slug: String.t() | nil,
          updated_at: DateTime.t(),
          webhook_secret: String.t() | nil
        }

  defstruct [
    :__info__,
    :client_id,
    :client_secret,
    :created_at,
    :description,
    :events,
    :external_url,
    :html_url,
    :id,
    :installations_count,
    :name,
    :node_id,
    :owner,
    :pem,
    :permissions,
    :slug,
    :updated_at,
    :webhook_secret
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      events: [string: :generic],
      external_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      installations_count: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      owner: {:union, [{GitHub.User, :simple}, :null]},
      pem: {:string, :generic},
      permissions: :map,
      slug: {:string, :generic},
      updated_at: {:string, :date_time},
      webhook_secret: {:union, [{:string, :generic}, :null]}
    ]
  end
end
