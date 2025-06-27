defmodule GitHub.ProtectedBranch.AllowForcePushes do
  @moduledoc """
  Provides struct and type for a ProtectedBranch.AllowForcePushes
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, enabled: boolean}

  defstruct [:__info__, :enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean]
  end
end
