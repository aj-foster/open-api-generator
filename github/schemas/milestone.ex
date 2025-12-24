defmodule GitHub.Milestone do
  @moduledoc """
  Provides struct and type for a Milestone
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          closed_at: DateTime.t() | nil,
          closed_issues: integer,
          created_at: DateTime.t(),
          creator: GitHub.User.simple() | nil,
          description: String.t() | nil,
          due_on: DateTime.t() | nil,
          html_url: String.t(),
          id: integer,
          labels_url: String.t(),
          node_id: String.t(),
          number: integer,
          open_issues: integer,
          state: String.t(),
          title: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :closed_at,
    :closed_issues,
    :created_at,
    :creator,
    :description,
    :due_on,
    :html_url,
    :id,
    :labels_url,
    :node_id,
    :number,
    :open_issues,
    :state,
    :title,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      closed_at: {:union, [{:string, "date-time"}, :null]},
      closed_issues: :integer,
      created_at: {:string, "date-time"},
      creator: {:union, [{GitHub.User, :simple}, :null]},
      description: {:union, [:string, :null]},
      due_on: {:union, [{:string, "date-time"}, :null]},
      html_url: {:string, "uri"},
      id: :integer,
      labels_url: {:string, "uri"},
      node_id: :string,
      number: :integer,
      open_issues: :integer,
      state: {:enum, ["open", "closed"]},
      title: :string,
      updated_at: {:string, "date-time"},
      url: {:string, "uri"}
    ]
  end
end
