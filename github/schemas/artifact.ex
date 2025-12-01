defmodule GitHub.Artifact do
  @moduledoc """
  Provides struct and type for a Artifact
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          archive_download_url: String.t(),
          created_at: DateTime.t() | nil,
          expired: boolean,
          expires_at: DateTime.t() | nil,
          id: integer,
          name: String.t(),
          node_id: String.t(),
          size_in_bytes: integer,
          updated_at: DateTime.t() | nil,
          url: String.t(),
          workflow_run: GitHub.ArtifactWorkflowRun.t() | nil
        }

  defstruct [
    :__info__,
    :archive_download_url,
    :created_at,
    :expired,
    :expires_at,
    :id,
    :name,
    :node_id,
    :size_in_bytes,
    :updated_at,
    :url,
    :workflow_run
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archive_download_url: :string,
      created_at: {:union, [{:string, "date-time"}, :null]},
      expired: :boolean,
      expires_at: {:union, [{:string, "date-time"}, :null]},
      id: :integer,
      name: :string,
      node_id: :string,
      size_in_bytes: :integer,
      updated_at: {:union, [{:string, "date-time"}, :null]},
      url: :string,
      workflow_run: {:union, [{GitHub.ArtifactWorkflowRun, :t}, :null]}
    ]
  end
end
