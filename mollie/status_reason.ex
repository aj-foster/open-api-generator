defmodule Mollie.StatusReason do
  @moduledoc """
  Provides struct and type for a StatusReason
  """

  @type t :: %__MODULE__{code: Mollie.StatusReasonCode.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {Mollie.StatusReasonCode, :t}, message: :string]
  end
end
