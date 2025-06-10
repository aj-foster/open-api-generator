defmodule GitHub.Actions.Workflow do
  @moduledoc """
  Provides struct and type for a Actions.Workflow
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          badge_url: String.t(),
          created_at: DateTime.t(),
          deleted_at: DateTime.t() | nil,
          html_url: String.t(),
          id: integer,
          name: String.t(),
          node_id: String.t(),
          path: String.t(),
          state: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :badge_url,
    :created_at,
    :deleted_at,
    :html_url,
    :id,
    :name,
    :node_id,
    :path,
    :state,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      badge_url: {:string, :generic},
      created_at: {:string, :date_time},
      deleted_at: {:string, :date_time},
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      path: {:string, :generic},
      state:
        {:enum,
         ["active", "deleted", "disabled_fork", "disabled_inactivity", "disabled_manually"]},
      updated_at: {:string, :date_time},
      url: {:string, :generic}
    ]
  end
end
