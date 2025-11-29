defmodule GitHub.OIDCCustomSubRepo do
  @moduledoc """
  Provides struct and type for a OIDCCustomSubRepo
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          include_claim_keys: [String.t()] | nil,
          use_default: boolean
        }

  defstruct [:__info__, :include_claim_keys, :use_default]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [include_claim_keys: [string: :generic], use_default: :boolean]
  end
end
