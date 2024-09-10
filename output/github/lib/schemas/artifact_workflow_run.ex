defmodule GitHub.ArtifactWorkflowRun do
  @moduledoc """
  Provides struct and type for a ArtifactWorkflowRun
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          head_branch: String.t() | nil,
          head_repository_id: integer | nil,
          head_sha: String.t() | nil,
          id: integer | nil,
          repository_id: integer | nil
        }

  defstruct [:__info__, :head_branch, :head_repository_id, :head_sha, :id, :repository_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      head_branch: {:string, :generic},
      head_repository_id: :integer,
      head_sha: {:string, :generic},
      id: :integer,
      repository_id: :integer
    ]
  end
end
