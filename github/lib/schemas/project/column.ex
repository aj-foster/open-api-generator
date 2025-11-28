defmodule GitHub.Project.Column do
  @moduledoc """
  Provides struct and type for a Project.Column
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          cards_url: String.t(),
          created_at: DateTime.t(),
          id: integer,
          name: String.t(),
          node_id: String.t(),
          project_url: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :cards_url,
    :created_at,
    :id,
    :name,
    :node_id,
    :project_url,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cards_url: {:string, :uri},
      created_at: {:string, :date_time},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      project_url: {:string, :uri},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
