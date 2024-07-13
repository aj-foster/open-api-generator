defmodule GitHub.FileCommitCommitVerification do
  @moduledoc """
  Provides struct and type for a FileCommitCommitVerification
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          payload: String.t() | nil,
          reason: String.t() | nil,
          signature: String.t() | nil,
          verified: boolean | nil
        }

  defstruct [:__info__, :payload, :reason, :signature, :verified]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payload: {:union, [{:string, :generic}, :null]},
      reason: {:string, :generic},
      signature: {:union, [{:string, :generic}, :null]},
      verified: :boolean
    ]
  end
end
