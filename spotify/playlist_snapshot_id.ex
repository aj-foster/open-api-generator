defmodule PlaylistSnapshotId do
  @moduledoc """
  Provides struct and type for a PlaylistSnapshotId
  """

  @type json_resp :: %__MODULE__{snapshot_id: String.t() | nil}

  defstruct [:snapshot_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [snapshot_id: {:string, :generic}]
  end
end
