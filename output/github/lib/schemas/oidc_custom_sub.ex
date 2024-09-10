defmodule GitHub.OIDCCustomSub do
  @moduledoc """
  Provides struct and type for a OIDCCustomSub
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, include_claim_keys: [String.t()]}

  defstruct [:__info__, :include_claim_keys]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [include_claim_keys: [string: :generic]]
  end
end
