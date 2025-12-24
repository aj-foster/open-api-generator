defmodule GitHub.Verification do
  @moduledoc """
  Provides struct and type for a Verification
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          payload: String.t() | nil,
          reason: String.t(),
          signature: String.t() | nil,
          verified: boolean
        }

  defstruct [:__info__, :payload, :reason, :signature, :verified]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payload: {:union, [:string, :null]},
      reason: :string,
      signature: {:union, [:string, :null]},
      verified: :boolean
    ]
  end
end
