defmodule GitHub.Commit.Stats do
  @moduledoc """
  Provides struct and type for a Commit.Stats
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          additions: integer | nil,
          deletions: integer | nil,
          total: integer | nil
        }

  defstruct [:__info__, :additions, :deletions, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [additions: :integer, deletions: :integer, total: :integer]
  end
end
