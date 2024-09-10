defmodule HealthStatus do
  @moduledoc """
  Provides struct and type for a HealthStatus
  """

  @type t :: %__MODULE__{ok: boolean}

  defstruct [:ok]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ok: :boolean]
  end
end
