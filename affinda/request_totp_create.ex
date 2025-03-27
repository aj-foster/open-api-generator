defmodule RequestTOTPCreate do
  @moduledoc """
  Provides struct and type for a RequestTOTPCreate
  """

  @type t :: %__MODULE__{otp: String.t(), uri: String.t(), verification_code: String.t()}

  defstruct [:otp, :uri, :verification_code]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [otp: {:string, :generic}, uri: {:string, :generic}, verification_code: {:string, :generic}]
  end
end
