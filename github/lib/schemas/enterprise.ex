defmodule GitHub.Enterprise do
  @moduledoc """
  Provides struct and type for a Enterprise
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          avatar_url: String.t(),
          created_at: DateTime.t() | nil,
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          name: String.t(),
          node_id: String.t(),
          slug: String.t(),
          updated_at: DateTime.t() | nil,
          website_url: String.t() | nil
        }

  defstruct [
    :__info__,
    :avatar_url,
    :created_at,
    :description,
    :html_url,
    :id,
    :name,
    :node_id,
    :slug,
    :updated_at,
    :website_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:string, :uri},
      created_at: {:union, [{:string, :date_time}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      slug: {:string, :generic},
      updated_at: {:union, [{:string, :date_time}, :null]},
      website_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end
