defmodule GitHub.Commit.Status do
  @moduledoc """
  Provides struct and type for a Commit.Status
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          avatar_url: String.t() | nil,
          context: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: integer,
          node_id: String.t(),
          required: boolean | nil,
          state: String.t(),
          target_url: String.t() | nil,
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :avatar_url,
    :context,
    :created_at,
    :description,
    :id,
    :node_id,
    :required,
    :state,
    :target_url,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:simple) do
    [
      avatar_url: {:union, [{:string, :uri}, :null]},
      context: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      node_id: {:string, :generic},
      required: {:union, [:boolean, :null]},
      state: {:string, :generic},
      target_url: {:union, [{:string, :uri}, :null]},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
