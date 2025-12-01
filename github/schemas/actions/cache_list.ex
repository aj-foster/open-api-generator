defmodule GitHub.Actions.CacheList do
  @moduledoc """
  Provides struct and type for a Actions.CacheList
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actions_caches: [GitHub.Actions.CacheListActionsCaches.t()],
          total_count: integer
        }

  defstruct [:__info__, :actions_caches, :total_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [actions_caches: [{GitHub.Actions.CacheListActionsCaches, :t}], total_count: :integer]
  end
end
