defmodule GitHub.ApiOverviewSshKeyFingerprints do
  @moduledoc """
  Provides struct and type for a ApiOverviewSshKeyFingerprints
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          SHA256_DSA: String.t() | nil,
          SHA256_ECDSA: String.t() | nil,
          SHA256_ED25519: String.t() | nil,
          SHA256_RSA: String.t() | nil,
          __info__: map
        }

  defstruct [:SHA256_DSA, :SHA256_ECDSA, :SHA256_ED25519, :SHA256_RSA, :__info__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SHA256_DSA: {:string, :generic},
      SHA256_ECDSA: {:string, :generic},
      SHA256_ED25519: {:string, :generic},
      SHA256_RSA: {:string, :generic}
    ]
  end
end
