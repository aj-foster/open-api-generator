defmodule GitHub.Snapshot do
  @moduledoc """
  Provides struct and type for a Snapshot
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          detector: GitHub.SnapshotDetector.t(),
          job: GitHub.SnapshotActions.Job.t(),
          manifests: map | nil,
          metadata: map | nil,
          ref: String.t(),
          scanned: DateTime.t(),
          sha: String.t(),
          version: integer
        }

  defstruct [:__info__, :detector, :job, :manifests, :metadata, :ref, :scanned, :sha, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      detector: {GitHub.SnapshotDetector, :t},
      job: {GitHub.SnapshotActions.Job, :t},
      manifests: :map,
      metadata: :map,
      ref: :string,
      scanned: {:string, "date-time"},
      sha: :string,
      version: :integer
    ]
  end
end
