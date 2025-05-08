defmodule GitHub.DiffEntry do
  @moduledoc """
  Provides struct and type for a DiffEntry
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          additions: integer,
          blob_url: String.t(),
          changes: integer,
          contents_url: String.t(),
          deletions: integer,
          filename: String.t(),
          patch: String.t() | nil,
          previous_filename: String.t() | nil,
          raw_url: String.t(),
          sha: String.t(),
          status: String.t()
        }

  defstruct [
    :__info__,
    :additions,
    :blob_url,
    :changes,
    :contents_url,
    :deletions,
    :filename,
    :patch,
    :previous_filename,
    :raw_url,
    :sha,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      additions: :integer,
      blob_url: {:string, :uri},
      changes: :integer,
      contents_url: {:string, :uri},
      deletions: :integer,
      filename: {:string, :generic},
      patch: {:string, :generic},
      previous_filename: {:string, :generic},
      raw_url: {:string, :uri},
      sha: {:string, :generic},
      status:
        {:enum, ["added", "removed", "modified", "renamed", "copied", "changed", "unchanged"]}
    ]
  end
end
