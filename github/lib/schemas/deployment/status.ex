defmodule GitHub.Deployment.Status do
  @moduledoc """
  Provides struct and type for a Deployment.Status
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          creator: GitHub.User.simple() | nil,
          deployment_url: String.t(),
          description: String.t(),
          environment: String.t() | nil,
          environment_url: String.t() | nil,
          id: integer,
          log_url: String.t() | nil,
          node_id: String.t(),
          performed_via_github_app: GitHub.App.t() | nil,
          repository_url: String.t(),
          state: String.t(),
          target_url: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :creator,
    :deployment_url,
    :description,
    :environment,
    :environment_url,
    :id,
    :log_url,
    :node_id,
    :performed_via_github_app,
    :repository_url,
    :state,
    :target_url,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      creator: {:union, [{GitHub.User, :simple}, :null]},
      deployment_url: {:string, :uri},
      description: {:string, :generic},
      environment: {:string, :generic},
      environment_url: {:string, :uri},
      id: :integer,
      log_url: {:string, :uri},
      node_id: {:string, :generic},
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      repository_url: {:string, :uri},
      state:
        {:enum, ["error", "failure", "inactive", "pending", "success", "queued", "in_progress"]},
      target_url: {:string, :uri},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
