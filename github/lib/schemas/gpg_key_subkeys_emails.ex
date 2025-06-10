defmodule GitHub.GpgKeySubkeysEmails do
  @moduledoc """
  Provides struct and type for a GpgKeySubkeysEmails
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, email: String.t() | nil, verified: boolean | nil}

  defstruct [:__info__, :email, :verified]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, :generic}, verified: :boolean]
  end
end
