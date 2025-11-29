defmodule GitHub.Codespace.GitStatus do
  @moduledoc """
  Provides struct and type for a Codespace.GitStatus
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          ahead: integer | nil,
          behind: integer | nil,
          has_uncommitted_changes: boolean | nil,
          has_unpushed_changes: boolean | nil,
          ref: String.t() | nil
        }

  defstruct [:__info__, :ahead, :behind, :has_uncommitted_changes, :has_unpushed_changes, :ref]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ahead: :integer,
      behind: :integer,
      has_uncommitted_changes: :boolean,
      has_unpushed_changes: :boolean,
      ref: {:string, :generic}
    ]
  end
end
