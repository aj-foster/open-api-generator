defmodule Discord.OAuth2Key do
  @moduledoc """
  Provides struct and type for a OAuth2Key
  """

  @type t :: %__MODULE__{
          alg: String.t(),
          e: String.t(),
          kid: String.t(),
          kty: String.t(),
          n: String.t(),
          use: String.t()
        }

  defstruct [:alg, :e, :kid, :kty, :n, :use]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [alg: :string, e: :string, kid: :string, kty: :string, n: :string, use: :string]
  end
end
