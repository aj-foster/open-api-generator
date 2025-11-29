defmodule GitHub.Project.Card do
  @moduledoc """
  Provides struct and type for a Project.Card
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          archived: boolean | nil,
          column_name: String.t() | nil,
          column_url: String.t(),
          content_url: String.t() | nil,
          created_at: DateTime.t(),
          creator: GitHub.User.simple() | nil,
          id: integer,
          node_id: String.t(),
          note: String.t() | nil,
          project_id: String.t() | nil,
          project_url: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :archived,
    :column_name,
    :column_url,
    :content_url,
    :created_at,
    :creator,
    :id,
    :node_id,
    :note,
    :project_id,
    :project_url,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
      column_name: {:string, :generic},
      column_url: {:string, :uri},
      content_url: {:string, :uri},
      created_at: {:string, :date_time},
      creator: {:union, [{GitHub.User, :simple}, :null]},
      id: :integer,
      node_id: {:string, :generic},
      note: {:union, [{:string, :generic}, :null]},
      project_id: {:string, :generic},
      project_url: {:string, :uri},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
