defmodule GitHub.ProtectedBranch.AdminEnforced do
  @moduledoc """
  Provides struct and type for a ProtectedBranch.AdminEnforced
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, enabled: boolean, url: String.t()}

  defstruct [:__info__, :enabled, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, url: {:string, :uri}]
  end
end
