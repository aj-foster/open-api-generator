defmodule GitHub.Actions.CacheListActionsCaches do
  @moduledoc """
  Provides struct and type for a Actions.CacheListActionsCaches
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          id: integer | nil,
          key: String.t() | nil,
          last_accessed_at: DateTime.t() | nil,
          ref: String.t() | nil,
          size_in_bytes: integer | nil,
          version: String.t() | nil
        }

  defstruct [:__info__, :created_at, :id, :key, :last_accessed_at, :ref, :size_in_bytes, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: :integer,
      key: {:string, :generic},
      last_accessed_at: {:string, :date_time},
      ref: {:string, :generic},
      size_in_bytes: :integer,
      version: {:string, :generic}
    ]
  end
end
