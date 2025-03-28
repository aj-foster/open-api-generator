defmodule GitHub.Deployment do
  @moduledoc """
  Provides struct and types for a Deployment
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          description: String.t() | nil,
          environment: String.t(),
          id: integer,
          node_id: String.t(),
          original_environment: String.t() | nil,
          performed_via_github_app: GitHub.App.t() | nil,
          production_environment: boolean | nil,
          repository_url: String.t(),
          statuses_url: String.t(),
          task: String.t(),
          transient_environment: boolean | nil,
          updated_at: DateTime.t(),
          url: String.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          creator: GitHub.User.simple() | nil,
          description: String.t() | nil,
          environment: String.t(),
          id: integer,
          node_id: String.t(),
          original_environment: String.t() | nil,
          payload: map | String.t(),
          performed_via_github_app: GitHub.App.t() | nil,
          production_environment: boolean | nil,
          ref: String.t(),
          repository_url: String.t(),
          sha: String.t(),
          statuses_url: String.t(),
          task: String.t(),
          transient_environment: boolean | nil,
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :creator,
    :description,
    :environment,
    :id,
    :node_id,
    :original_environment,
    :payload,
    :performed_via_github_app,
    :production_environment,
    :ref,
    :repository_url,
    :sha,
    :statuses_url,
    :task,
    :transient_environment,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      environment: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      original_environment: {:string, :generic},
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      production_environment: :boolean,
      repository_url: {:string, :uri},
      statuses_url: {:string, :uri},
      task: {:string, :generic},
      transient_environment: :boolean,
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      creator: {:union, [{GitHub.User, :simple}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      environment: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      original_environment: {:string, :generic},
      payload: {:union, [:map, string: :generic]},
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      production_environment: :boolean,
      ref: {:string, :generic},
      repository_url: {:string, :uri},
      sha: {:string, :generic},
      statuses_url: {:string, :uri},
      task: {:string, :generic},
      transient_environment: :boolean,
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
