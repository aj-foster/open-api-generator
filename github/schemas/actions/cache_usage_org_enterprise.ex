defmodule GitHub.Actions.CacheUsageOrgEnterprise do
  @moduledoc """
  Provides struct and type for a Actions.CacheUsageOrgEnterprise
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          total_active_caches_count: integer,
          total_active_caches_size_in_bytes: integer
        }

  defstruct [:__info__, :total_active_caches_count, :total_active_caches_size_in_bytes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [total_active_caches_count: :integer, total_active_caches_size_in_bytes: :integer]
  end
end
